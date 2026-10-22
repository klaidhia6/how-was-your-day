import { z } from 'zod';

export const entrySchema = z.object({
  date: z.iso.date(),
  rating: z.number().int().min(1).max(10),
  note: z.string().max(4000),
  tags: z.array(z.string().trim().min(1).max(30)).max(12),
}).strict();

export const reflectionRequestSchema = z.object({
  period: z.enum(['weekly', 'monthly']),
  language: z.enum(['en', 'fr', 'es', 'it', 'de', 'pt', 'ar']).default('en'),
  entries: z.array(entrySchema).min(1).max(31),
}).strict();

export const reflectionContentSchema = z.object({
  title: z.string().min(1).max(100),
  overall: z.string().min(1).max(1200),
  wins: z.array(z.string().min(1).max(500)).max(5),
  challenges: z.array(z.string().min(1).max(500)).max(5),
  patterns: z.array(z.string().min(1).max(500)).max(5),
  suggestions: z.array(z.string().min(1).max(500)).min(1).max(3),
}).strict();

export type ReflectionRequest = z.infer<typeof reflectionRequestSchema>;
export type ReflectionContent = z.infer<typeof reflectionContentSchema>;
