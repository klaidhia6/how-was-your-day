import OpenAI from 'openai';
import { zodTextFormat } from 'openai/helpers/zod';

import { reflectionContentSchema, type ReflectionContent, type ReflectionRequest } from './schema.js';

export interface ReflectionGenerator {
  generate(request: ReflectionRequest): Promise<ReflectionContent>;
}

const baseSystemInstruction = `Generate a personal reflection from journal entries voluntarily submitted by the user.
Be supportive, neutral, concise, and practical. Use only information supplied in the journal entries.
Identify patterns only when they are supported by the entries. When there is insufficient evidence for a pattern, say so.
Do not diagnose mental or physical health conditions. Do not judge the user's personality or make personality claims.
Do not use shame, insults, or judgmental language. Clearly distinguish observations from suggestions.
Use cautious language such as "Your entries suggest" and never present correlation as causation.`;

const languageNames = {
  en: 'English',
  fr: 'French',
  es: 'Spanish',
  it: 'Italian',
  de: 'German',
  pt: 'Portuguese',
  ar: 'Arabic',
} as const;

export function buildSystemInstruction(
  language: keyof typeof languageNames,
): string {
  return `${baseSystemInstruction}\nGenerate the entire reflection in the requested language: ${languageNames[language]}. Understand entries written in any language or a mix of languages, but do not translate or alter the original journal entries. Keep JSON property names in English.`;
}

export class OpenAIReflectionGenerator implements ReflectionGenerator {
  constructor(private readonly openai: OpenAI) {}

  async generate(request: ReflectionRequest): Promise<ReflectionContent> {
    const response = await this.openai.responses.parse({
      model: 'gpt-6-luna',
      instructions: buildSystemInstruction(request.language),
      input: JSON.stringify({
        period: request.period,
        language: request.language,
        entries: request.entries,
      }),
      text: {
        format: zodTextFormat(reflectionContentSchema, 'journal_reflection'),
      },
    }, {
      timeout: 25_000,
      maxRetries: 0,
    });

    if (!response.output_parsed) {
      throw new Error('AI provider returned no structured reflection');
    }
    return reflectionContentSchema.parse(response.output_parsed);
  }
}
