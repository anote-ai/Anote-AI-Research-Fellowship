# Anote Product Codebase Setup Guide

**For fellows starting the summer:** this doc is your single entry point to every Anote product repo. Each section tells you what the product does, how to get it running locally in under 10 minutes, and how to contribute code correctly.

---

## Quick Navigation

| # | Product | Repo | Stack | Status | Setup Doc |
|---|---------|------|-------|--------|-----------|
| 1 | MLOps Platform (OpenAnote) | [anote-ai/OpenAnote](https://github.com/anote-ai/OpenAnote) | Python | Production | [→](#1-openanote--mlops-platform) |
| 2 | Panacea (Autonomous Intelligence) | [anote-ai/Autonomous-Intelligence](https://github.com/anote-ai/Autonomous-Intelligence) | Python | Production | [→](#2-panacea--autonomous-intelligence) |
| 3 | Armor (Community Hub) | [anote-ai/Community](https://github.com/anote-ai/Community) | Node/React | Production | [→](#3-armor--community-hub) |
| 4 | Model Leaderboard | [anote-ai/Leaderboard](https://github.com/anote-ai/Leaderboard) | Python/Node | POC | [→](#4-model-leaderboard) |
| 5 | Synthetic Data | [anote-ai/Synthetic-Data](https://github.com/anote-ai/Synthetic-Data) | Python | POC | [→](#5-synthetic-data) |
| 6 | PrivateGPT Desktop | [anote-ai/PrivateGPT-Desktop](https://github.com/anote-ai/PrivateGPT-Desktop) | Python/Electron | POC | [→](#6-privategpt-desktop) |
| 7 | Slackbot | [anote-ai/Slackbot](https://github.com/anote-ai/Slackbot) | Python | — | [→](#7-slackbot) |
| 8 | AI RFPs | [anote-ai/AI-RFPs](https://github.com/anote-ai/AI-RFPs) | Python | — | [→](#8-ai-rfps) |
| 9 | Upreach | [anote-ai/Upreach](https://github.com/anote-ai/Upreach) | Python/Node | — | [→](#9-upreach) |
| 10 | AI Assisted Coding Tool | [anote-ai/AI-Assisted-Coding-Tool](https://github.com/anote-ai/AI-Assisted-Coding-Tool) | Python | Production | [→](#10-ai-assisted-coding-tool) |

---

## Prerequisites (All Repos)

Install these once before starting on any product:

```bash
# Python (3.11 recommended)
python --version  # should be 3.11+

# Docker + Docker Compose
docker --version          # 24+
docker compose version    # 2.x

# Node.js (for JS-based repos)
node --version   # 18+ LTS

# Git
git --version
```

**API keys you'll need** (get from Natan or the PM before week 1):
- `ANTHROPIC_API_KEY` — for Claude/Claude Code
- `OPENAI_API_KEY` — for any OpenAI-based features
- Any Anote internal API keys (provided via Slack)

---

## Universal Setup Steps (All Repos)

```bash
# 1. Clone your assigned repo
git clone https://github.com/anote-ai/<REPO-NAME>.git
cd <REPO-NAME>

# 2. Copy environment variables template
cp .env.example .env
# Then fill in your API keys in .env

# 3. Start with Docker Compose (fastest path)
docker compose up --build

# 4. Run tests to confirm everything works
docker compose run --rm app pytest        # Python
docker compose run --rm app npm test      # Node
```

If the repo does not yet have a `docker-compose.yml`, use the templates in `docker-templates/` in this directory and open a PR adding one.

---

## Contributing Code — Rules for All Repos

1. **Never push directly to `main`.** Always branch from `main`, open a PR, and request a review.
2. **CI must be green before merge.** If your PR fails CI, fix it before asking for review.
3. **Write a clear PR description.** What changed, why, and how to test it.
4. **One concern per PR.** Don't bundle unrelated changes.
5. **Run the test suite locally before pushing.** `pytest` for Python, `npm test` for Node.

```bash
# Correct workflow
git checkout main && git pull
git checkout -b your-name/feature-description
# ... make changes ...
git add <specific files>
git commit -m "Short description of what and why"
git push -u origin your-name/feature-description
# Then open a PR on GitHub
```

---

## Product Setup Details

---

### 1. OpenAnote — MLOps Platform

**What it does:** Core Anote MLOps platform — model training, fine-tuning, data labeling, and pipeline management for enterprise customers.

**Repo:** github.com/anote-ai/OpenAnote
**Stack:** Python (FastAPI backend), likely React/Next.js frontend
**Status:** Production

**Local setup:**
```bash
git clone https://github.com/anote-ai/OpenAnote.git && cd OpenAnote
cp .env.example .env          # fill in keys
docker compose up --build     # starts all services
# API: http://localhost:8000
# Frontend (if applicable): http://localhost:3000
```

**Run tests:**
```bash
docker compose run --rm app pytest tests/ -v
```

**Good first contributions:**
- Add a missing test for an existing API endpoint
- Improve error messages for a failing pipeline step
- Add documentation for an undocumented feature

**Your assigned PM contact:** Check `PRODUCT_FELLOW_MATCHING.md` in the fellowship repo.

---

### 2. Panacea — Autonomous Intelligence

**What it does:** Agentic AI system for autonomous task execution — Anote's "agent" product. Handles complex multi-step workflows using LLMs.

**Repo:** github.com/anote-ai/Autonomous-Intelligence
**Stack:** Python (LangChain / custom agent framework)
**Status:** Production

**Local setup:**
```bash
git clone https://github.com/anote-ai/Autonomous-Intelligence.git && cd Autonomous-Intelligence
cp .env.example .env
docker compose up --build
# Agent API: http://localhost:8080
```

**Run tests:**
```bash
docker compose run --rm app pytest tests/ -v
```

**Good first contributions:**
- Add an evaluation harness for a new agent task type
- Improve agent failure handling / retry logic
- Document the agent architecture in the README

---

### 3. Armor — Community Hub

**What it does:** Anote's community platform — discussion forums, resource sharing, and networking for Anote users and customers.

**Repo:** github.com/anote-ai/Community
**Stack:** Node.js / React (likely Next.js)
**Status:** Production

**Local setup:**
```bash
git clone https://github.com/anote-ai/Community.git && cd Community
cp .env.example .env
npm install
docker compose up --build
# App: http://localhost:3000
```

**Run tests:**
```bash
npm test
# or
docker compose run --rm app npm test
```

**Good first contributions:**
- Improve a UI component's responsiveness
- Add input validation to a form
- Fix an accessibility issue (a11y)

---

### 4. Model Leaderboard

**What it does:** Automated benchmark leaderboard comparing AI model performance across tasks relevant to Anote's use cases.

**Repo:** github.com/anote-ai/Leaderboard
**Stack:** Python (evaluation pipeline) + frontend (likely React or Streamlit)
**Status:** POC — actively being built

**Local setup:**
```bash
git clone https://github.com/anote-ai/Leaderboard.git && cd Leaderboard
cp .env.example .env
docker compose up --build
# Dashboard: http://localhost:8501 (Streamlit) or http://localhost:3000
```

**Run tests:**
```bash
docker compose run --rm app pytest tests/ -v
```

**Good first contributions:**
- Add a new benchmark task to the evaluation suite
- Add a new model to compare
- Improve the leaderboard visualization

---

### 5. Synthetic Data

**What it does:** LLM-powered synthetic data generation for fine-tuning, annotation, and data augmentation. Supports various data types (text, classification, QA, NER).

**Repo:** github.com/anote-ai/Synthetic-Data
**Stack:** Python (FastAPI or script-based)
**Status:** POC — actively being built

**Local setup:**
```bash
git clone https://github.com/anote-ai/Synthetic-Data.git && cd Synthetic-Data
cp .env.example .env
docker compose up --build
# API: http://localhost:8000
```

**Run tests:**
```bash
docker compose run --rm app pytest tests/ -v
```

**Good first contributions:**
- Add a new data generation template
- Improve output quality filtering
- Add evaluation metrics for generated data quality

---

### 6. PrivateGPT Desktop

**What it does:** Desktop app for running private, local LLM-powered chat — no data leaves the user's machine. Built for enterprise customers with strict data privacy requirements.

**Repo:** github.com/anote-ai/PrivateGPT-Desktop
**Stack:** Python (backend) + Electron (desktop wrapper) or Tauri
**Status:** POC

**Local setup:**
```bash
git clone https://github.com/anote-ai/PrivateGPT-Desktop.git && cd PrivateGPT-Desktop
cp .env.example .env
# Python backend
pip install -r requirements.txt
python app.py
# Desktop app (if Electron)
npm install && npm start
```

**Note:** This app runs local models — you'll need at least 8GB RAM and ideally a GPU for good performance.

**Run tests:**
```bash
pytest tests/ -v
npm test
```

---

### 7. Slackbot

**What it does:** AI-powered Slack integration that brings Anote's capabilities directly into Slack workspaces — answers questions, summarizes threads, assists with tasks.

**Repo:** github.com/anote-ai/Slackbot
**Stack:** Python (Slack Bolt SDK)
**Status:** Early stage

**Local setup:**
```bash
git clone https://github.com/anote-ai/Slackbot.git && cd Slackbot
cp .env.example .env
# You'll need Slack app credentials (get from PM)
# SLACK_BOT_TOKEN=xoxb-...
# SLACK_SIGNING_SECRET=...
docker compose up --build
# Use ngrok to expose local server for Slack webhooks:
ngrok http 3000
# Then update your Slack app's event URL to the ngrok URL
```

**Run tests:**
```bash
docker compose run --rm app pytest tests/ -v
```

---

### 8. AI RFPs

**What it does:** AI-assisted tool for responding to enterprise RFPs (Requests for Proposals) — auto-fills responses based on Anote's knowledge base and past proposals.

**Repo:** github.com/anote-ai/AI-RFPs
**Stack:** Python (LLM pipeline + document parsing)
**Status:** Early stage

**Local setup:**
```bash
git clone https://github.com/anote-ai/AI-RFPs.git && cd AI-RFPs
cp .env.example .env
docker compose up --build
# API or UI: http://localhost:8000
```

**Run tests:**
```bash
docker compose run --rm app pytest tests/ -v
```

---

### 9. Upreach

**What it does:** AI-powered outreach tool — automates personalized outreach messages for sales, recruiting, and partnership campaigns.

**Repo:** github.com/anote-ai/Upreach
**Stack:** Python / Node.js
**Status:** Early stage

**Local setup:**
```bash
git clone https://github.com/anote-ai/Upreach.git && cd Upreach
cp .env.example .env
docker compose up --build
```

**Run tests:**
```bash
docker compose run --rm app pytest tests/ -v
# or
docker compose run --rm app npm test
```

---

### 10. AI Assisted Coding Tool

**What it does:** Anote's AI pair-programming product — code completion, review, and generation capabilities integrated into developer workflows.

**Repo:** github.com/anote-ai/AI-Assisted-Coding-Tool
**Stack:** Python + VS Code extension (TypeScript/Node)
**Status:** Production

**Local setup:**
```bash
git clone https://github.com/anote-ai/AI-Assisted-Coding-Tool.git && cd AI-Assisted-Coding-Tool
cp .env.example .env
# Python backend
docker compose up --build
# VS Code extension development
cd extension && npm install
# Press F5 in VS Code to launch Extension Development Host
```

**Run tests:**
```bash
docker compose run --rm app pytest tests/ -v
cd extension && npm test
```

---

## Adding CI/CD to a Repo

If your assigned repo doesn't have GitHub Actions CI, add it using the templates in `ci-cd-templates/`:

```bash
# In your product repo
mkdir -p .github/workflows

# For a Python repo
cp /path/to/fellowship-repo/codebase-setup/ci-cd-templates/python-ci.yml .github/workflows/ci.yml

# For a Node/JS repo
cp /path/to/fellowship-repo/codebase-setup/ci-cd-templates/node-ci.yml .github/workflows/ci.yml

# Commit and push
git add .github/
git commit -m "Add GitHub Actions CI workflow"
git push
```

---

## Adding Docker Compose to a Repo

If your assigned repo doesn't have a `docker-compose.yml`:

```bash
# For a Python app
cp /path/to/fellowship-repo/codebase-setup/docker-templates/python-app/docker-compose.yml .
cp /path/to/fellowship-repo/codebase-setup/docker-templates/python-app/Dockerfile .
cp /path/to/fellowship-repo/codebase-setup/docker-templates/python-app/.env.example .

# For a Node app
cp /path/to/fellowship-repo/codebase-setup/docker-templates/node-app/docker-compose.yml .
cp /path/to/fellowship-repo/codebase-setup/docker-templates/node-app/Dockerfile .
```

Then adapt to the repo's actual structure and open a PR.

---

## Getting Help

- **Stuck on setup?** Post in #product-standup Slack channel with your repo name and error message
- **Need API keys or access?** DM the PM (Rajshri)
- **Need a code review?** Tag your fellow or Natan in your PR
- **Dependency on another repo?** Raise it at Thursday standup — don't block silently
