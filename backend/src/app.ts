import express, { type ErrorRequestHandler } from 'express';
import rateLimit from 'express-rate-limit';
import { ZodError } from 'zod';

import type { ReflectionGenerator } from './reflection-generator.js';
import { reflectionRequestSchema } from './schema.js';

export function createApp(generator: ReflectionGenerator) {
  const app = express();
  app.set('trust proxy', 1);
  app.disable('x-powered-by');
  app.use(express.json({ limit: '128kb', strict: true }));
  app.use('/api', rateLimit({
    windowMs: 15 * 60 * 1000,
    limit: 20,
    standardHeaders: 'draft-8',
    legacyHeaders: false,
  }));

  app.get('/health', (_request, response) => response.json({ ok: true }));

  app.post('/api/reflection', async (request, response) => {
    const parsed = reflectionRequestSchema.safeParse(request.body);
    if (!parsed.success) {
      response.status(400).json({
        error: 'invalid_request',
        message: 'The reflection request was malformed.',
      });
      return;
    }
    const minimum = parsed.data.period === 'weekly' ? 3 : 7;
    if (parsed.data.entries.length < minimum) {
      response.status(422).json({
        error: 'insufficient_entries',
        message: 'Log a few more days before generating a reflection.',
      });
      return;
    }
    try {
      const reflection = await generator.generate(parsed.data);
      response.json({ reflection });
    } catch {
      // Journal text is intentionally never written to logs.
      console.error('Reflection generation failed');
      response.status(502).json({
        error: 'reflection_unavailable',
        message: "Your reflection couldn't be generated right now. Please try again later.",
      });
    }
  });

  const errorHandler: ErrorRequestHandler = (error, _request, response, _next) => {
    const malformedJson = error instanceof SyntaxError && 'body' in error;
    response.status(malformedJson ? 400 : 500).json({
      error: malformedJson ? 'invalid_json' : 'server_error',
      message: malformedJson ? 'The request body was not valid JSON.' : 'Something went wrong.',
    });
  };
  app.use(errorHandler);
  return app;
}
