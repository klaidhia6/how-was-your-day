import assert from 'node:assert/strict';
import { describe, it } from 'node:test';
import request from 'supertest';

import { createApp } from '../src/app.js';
import type { ReflectionGenerator } from '../src/reflection-generator.js';

const reflection = {
  title: 'Your weekly reflection',
  overall: 'A generally steady week.',
  wins: ['Time with friends appeared on a higher-rated day.'],
  challenges: [],
  patterns: ['Ratings were fairly consistent.'],
  suggestions: ['Keep noting what supports the better days.'],
};

const validEntries = [
  { date: '2026-10-01', rating: 7, note: '', tags: ['Work'] },
  { date: '2026-10-02', rating: 8, note: 'Walked outside', tags: ['Exercise'] },
  { date: '2026-10-03', rating: 6, note: '', tags: [] },
];

describe('POST /api/reflection', () => {
  it('reports healthy without invoking the reflection generator', async () => {
    const app = createApp({
      generate: async () => { throw new Error('health check should not generate'); },
    });

    const response = await request(app).get('/health');

    assert.equal(response.status, 200);
    assert.deepEqual(response.body, { ok: true });
  });

  it('rejects missing entries', async () => {
    const app = createApp({ generate: async () => reflection });
    const response = await request(app).post('/api/reflection').send({ period: 'weekly' });
    assert.equal(response.status, 400);
  });

  it('rejects invalid ratings', async () => {
    const app = createApp({ generate: async () => reflection });
    const response = await request(app).post('/api/reflection').send({
      period: 'weekly',
      entries: validEntries.map((entry, index) => index === 0 ? { ...entry, rating: 11 } : entry),
    });
    assert.equal(response.status, 400);
  });

  it('rejects too many entries', async () => {
    const app = createApp({ generate: async () => reflection });
    const response = await request(app).post('/api/reflection').send({
      period: 'monthly',
      entries: Array.from({ length: 32 }, (_, index) => ({
        date: `2026-10-${String((index % 28) + 1).padStart(2, '0')}`,
        rating: 7,
        note: '',
        tags: [],
      })),
    });
    assert.equal(response.status, 400);
  });

  it('rejects malformed JSON', async () => {
    const app = createApp({ generate: async () => reflection });
    const response = await request(app)
      .post('/api/reflection')
      .set('content-type', 'application/json')
      .send('{broken');
    assert.equal(response.status, 400);
  });

  it('accepts a valid request shape', async () => {
    let receivedLanguage: string | undefined;
    const app = createApp({ generate: async (payload) => {
      receivedLanguage = payload.language;
      return reflection;
    } });
    const response = await request(app).post('/api/reflection').send({
      period: 'weekly',
      language: 'fr',
      entries: validEntries,
    });
    assert.equal(response.status, 200);
    assert.deepEqual(response.body.reflection, reflection);
    assert.equal(receivedLanguage, 'fr');
  });

  it('falls back to English when language is omitted', async () => {
    let receivedLanguage: string | undefined;
    const app = createApp({ generate: async (payload) => {
      receivedLanguage = payload.language;
      return reflection;
    } });
    const response = await request(app).post('/api/reflection').send({
      period: 'weekly',
      entries: validEntries,
    });
    assert.equal(response.status, 200);
    assert.equal(receivedLanguage, 'en');
  });

  it('rejects an unsupported language', async () => {
    const app = createApp({ generate: async () => reflection });
    const response = await request(app).post('/api/reflection').send({
      period: 'weekly',
      language: 'xx',
      entries: validEntries,
    });
    assert.equal(response.status, 400);
  });

  it('returns a safe error when the AI provider fails', async () => {
    const privateNote = 'private journal note';
    const originalConsoleError = console.error;
    const logged: unknown[][] = [];
    console.error = (...arguments_) => logged.push(arguments_);
    try {
      const failing: ReflectionGenerator = {
        generate: async () => { throw new Error(`secret upstream detail: ${privateNote}`); },
      };
      const app = createApp(failing);
      const response = await request(app).post('/api/reflection').send({
        period: 'weekly',
        entries: validEntries.map((entry, index) => (
          index === 0 ? { ...entry, note: privateNote } : entry
        )),
      });
      assert.equal(response.status, 502);
      assert.equal(response.body.error, 'reflection_unavailable');
      assert.equal(JSON.stringify(response.body).includes('secret'), false);
    } finally {
      console.error = originalConsoleError;
    }
    assert.equal(JSON.stringify(logged).includes(privateNote), false);
  });
});
