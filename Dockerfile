FROM node:24-slim

WORKDIR /app

RUN corepack enable && corepack prepare pnpm@10.21.0 --activate

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc tsconfig.json tsconfig.base.json ./
COPY artifacts/api-server/package.json artifacts/api-server/package.json
COPY artifacts/psx-insight/package.json artifacts/psx-insight/package.json
COPY artifacts/mockup-sandbox/package.json artifacts/mockup-sandbox/package.json
COPY lib/api-client-react/package.json lib/api-client-react/package.json
COPY lib/api-spec/package.json lib/api-spec/package.json
COPY lib/api-zod/package.json lib/api-zod/package.json
COPY lib/db/package.json lib/db/package.json
COPY lib/integrations-anthropic-ai/package.json lib/integrations-anthropic-ai/package.json
COPY scripts/package.json scripts/package.json
COPY scripts/enforce-pnpm.cjs scripts/enforce-pnpm.cjs

RUN pnpm install --frozen-lockfile

COPY . .

ENV NODE_ENV=production
ENV BASE_PATH=/

RUN pnpm run build:deploy

EXPOSE 8080

CMD ["pnpm", "run", "start:deploy"]
