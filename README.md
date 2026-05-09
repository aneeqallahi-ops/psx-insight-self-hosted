# PSX Insight Self Hosted

Deployment-ready fork of the Replit PSX Insight app.

This repository is configured to run outside Replit with:

- a long-running Express API service
- a built Vite frontend served by the API
- Postgres via `DATABASE_URL`
- direct Anthropic API credentials via `ANTHROPIC_API_KEY`

See [DEPLOYMENT_SELF_HOST.md](DEPLOYMENT_SELF_HOST.md) for deployment notes.
