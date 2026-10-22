import assert from 'node:assert/strict';
import { describe, it, mock } from 'node:test';

import OpenAI from 'openai';

import {
  buildSystemInstruction,
  OpenAIReflectionGenerator,
} from '../src/reflection-generator.js';

const request = {
  period: 'weekly' as const,
  language: 'fr' as const,
  entries: [
    { date: '2026-10-01', rating: 7, note: 'Promenade', tags: ['Exercise'] },
  ],
};

const reflection = {
  title: 'Votre semaine',
  overall: 'Une semaine plutôt stable.',
  wins: ['Vous avez pris le temps de marcher.'],
  challenges: [],
  patterns: ['Une seule entrée ne suffit pas pour dégager une tendance.'],
  suggestions: ['Continuez à noter ce qui vous aide.'],
};

describe('AI language instruction', () => {
  it('explicitly requests the selected output language', () => {
    const instruction = buildSystemInstruction('fr');
    assert.match(
      instruction,
      /Generate the entire reflection in the requested language: French\./,
    );
    assert.match(instruction, /Keep JSON property names in English/);
  });

  it('uses the mocked Responses API with the fixed model and validated request data', async () => {
    const client = new OpenAI({ apiKey: 'test-key' });
    const parse = mock.method(
      client.responses,
      'parse',
      async () => ({ output_parsed: reflection }) as never,
    );
    const generator = new OpenAIReflectionGenerator(client);

    const result = await generator.generate(request);

    assert.deepEqual(result, reflection);
    assert.equal(parse.mock.calls.length, 1);
    const [parameters, options] = parse.mock.calls[0].arguments;
    assert.ok(parameters);
    assert.equal(parameters.model, 'gpt-6-luna');
    assert.equal(parameters.instructions, buildSystemInstruction('fr'));
    assert.deepEqual(JSON.parse(parameters.input as string), request);
    assert.equal(parameters.text?.format?.type, 'json_schema');
    assert.equal(options?.timeout, 25_000);
    assert.equal(options?.maxRetries, 0);
  });

  it('rejects invalid structured data returned by the mocked client', async () => {
    const client = new OpenAI({ apiKey: 'test-key' });
    mock.method(
      client.responses,
      'parse',
      async () => ({ output_parsed: { ...reflection, suggestions: [] } }) as never,
    );
    const generator = new OpenAIReflectionGenerator(client);

    await assert.rejects(generator.generate(request));
  });
});
