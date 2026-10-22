import 'dotenv/config';

import OpenAI from 'openai';

import { createApp } from './app.js';
import { OpenAIReflectionGenerator } from './reflection-generator.js';

if (!process.env.OPENAI_API_KEY) throw new Error('OPENAI_API_KEY is required');

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

const port = Number(process.env.PORT ?? 3000);
const generator = new OpenAIReflectionGenerator(openai);
createApp(generator).listen(port, '0.0.0.0', () => {
  console.log(`Reflection API listening on port ${port}`);
});
