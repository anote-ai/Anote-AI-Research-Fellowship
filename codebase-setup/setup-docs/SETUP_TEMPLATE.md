# [Product Name] — Setup Guide

> Copy this file to the root of your product repo as `SETUP.md` and fill in the details.

**Repo:** github.com/anote-ai/[repo-name]
**Stack:** [Python / Node / etc.]
**Status:** [Production / POC / Early Stage]
**Fellow Owner (Summer 2026):** [Your name]

---

## What This Product Does

[2–3 sentences describing the product and its purpose for enterprise customers.]

---

## Prerequisites

| Tool | Version | Install |
|------|---------|---------|
| Docker | 24+ | [docs.docker.com](https://docs.docker.com/get-docker/) |
| Docker Compose | 2.x | Included with Docker Desktop |
| Python | 3.11+ | [python.org](https://python.org) *(if running outside Docker)* |
| Node.js | 18+ LTS | [nodejs.org](https://nodejs.org) *(if running outside Docker)* |

**API keys needed** (get from PM before week 1):
- `ANTHROPIC_API_KEY`
- `OPENAI_API_KEY` *(if applicable)*
- [any other keys]

---

## Quickstart (Docker — Recommended)

```bash
# 1. Clone the repo
git clone https://github.com/anote-ai/[repo-name].git
cd [repo-name]

# 2. Set up environment variables
cp .env.example .env
# Edit .env with your API keys — do not commit .env

# 3. Start all services
docker compose up --build

# App running at: http://localhost:[PORT]
```

---

## Quickstart (Without Docker)

```bash
# 1. Clone and enter the repo
git clone https://github.com/anote-ai/[repo-name].git
cd [repo-name]

# 2. Install dependencies
pip install -r requirements.txt    # Python
# or
npm install                         # Node

# 3. Set up environment variables
cp .env.example .env
# Edit .env

# 4. Run the app
python main.py       # Python — adjust to your entrypoint
# or
npm run dev          # Node
```

---

## Running Tests

```bash
# With Docker
docker compose run --rm app pytest tests/ -v         # Python
docker compose run --rm app npm test                  # Node

# Without Docker
pytest tests/ -v
npm test
```

Tests must pass before opening a PR. CI enforces this automatically.

---

## Project Structure

```
[repo-name]/
├── [main entrypoint file]
├── [src / app / lib directory]
├── tests/
├── .github/
│   └── workflows/
│       └── ci.yml
├── docker-compose.yml
├── Dockerfile
├── requirements.txt (or package.json)
├── .env.example
└── SETUP.md
```

---

## Common Commands

| Task | Command |
|------|---------|
| Start app | `docker compose up` |
| Start app (rebuild) | `docker compose up --build` |
| Stop app | `docker compose down` |
| Run tests | `docker compose run --rm app pytest tests/ -v` |
| Open a shell | `docker compose run --rm app bash` |
| View logs | `docker compose logs -f app` |

---

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `ANTHROPIC_API_KEY` | Yes | Claude API key |
| `OPENAI_API_KEY` | No | OpenAI key (if applicable) |
| `DATABASE_URL` | If using DB | PostgreSQL connection string |
| `DEBUG` | No | Set to `true` for verbose logging |

---

## Contributing

1. Never push directly to `main` — always branch and PR
2. Branch naming: `your-name/feature-description`
3. CI must be green before requesting review
4. Include a clear PR description: what changed, why, how to test
5. For major changes, discuss in Thursday standup before starting

```bash
git checkout main && git pull
git checkout -b your-name/feature-description
# ... make changes ...
git add <specific files>
git commit -m "Short, clear description"
git push -u origin your-name/feature-description
# Open PR on GitHub
```

---

## Architecture

[Optional: add a diagram or description of how components connect]

---

## Known Issues / Gotchas

- [List any known setup issues or non-obvious configuration requirements]
- [E.g. "You need at least 8GB RAM for the local model to run"]
- [E.g. "The Slack integration requires an ngrok tunnel in local dev"]

---

## Contact

- **Fellow owner:** [Your name] — @[slack handle]
- **PM:** Rajshri — @[slack handle]
- **Technical questions:** Raise in Thursday product standup or #product-[name] Slack channel
