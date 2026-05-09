import Anthropic from "@anthropic-ai/sdk";

const apiKey =
  process.env.ANTHROPIC_API_KEY ??
  process.env.AI_INTEGRATIONS_ANTHROPIC_API_KEY;

if (!apiKey) {
  throw new Error(
    "ANTHROPIC_API_KEY must be set. Create an Anthropic API key and add it to the API service environment.",
  );
}

const baseURL =
  process.env.ANTHROPIC_BASE_URL ??
  process.env.AI_INTEGRATIONS_ANTHROPIC_BASE_URL;

export const anthropic = new Anthropic({
  apiKey,
  ...(baseURL ? { baseURL } : {}),
});
