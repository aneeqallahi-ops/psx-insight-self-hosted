# PSX Insight Self-Hosted Deployment

This version removes the Replit hosting and Replit AI integration assumptions.

## Runtime

- Node.js 24
- pnpm 10
- Postgres
- Long-running web service

## Required Environment

```text
PORT=8080
DATABASE_URL=postgresql://...
ANTHROPIC_API_KEY=sk-ant-...
ANTHROPIC_MODEL=claude-sonnet-4-6
BASE_PATH=/
PUBLIC_BASE_URL=https://your-domain.example
```

Optional email alerts:

```text
SENDGRID_API_KEY=
NOTIFY_FROM_EMAIL=
NOTIFY_FROM_NAME=PSX Insight Alerts
```

## One-Service Deployment

Build both the Vite frontend and Express API:

```bash
pnpm install --frozen-lockfile
pnpm run db:push
pnpm run build:deploy
pnpm run start:deploy
```

The API server serves:

- `/api/*` from Express
- the built frontend from `artifacts/psx-insight/dist/public`
- SPA fallback routes like `/markets`, `/watchlist`, `/analysis`, and `/alerts`

## Docker

```bash
docker build -t psx-insight .
docker run --env-file .env -p 8080:8080 psx-insight
```

Before first production start, run the Drizzle schema push against the target database:

```bash
pnpm run db:push
```
