# Codebase Setup Overview — Anote AI Research Fellowship Summer 2026

> **For Fellows:** This document explains the 10 product repositories you are responsible for during the fellowship. Each fellow owns one product. Use this guide to get set up, understand the CI/CD pipeline, and know where to find detailed instructions for your repo.
>
> **Program:** Anote AI Research Fellowship | Summer 2026 (Jun 1 – Aug 10)  
> **PM:** Rajshri | **Program Lead:** Natan  

---

## Introduction

As a fellow, your primary product responsibility is to own one of the 10 Anote AI products listed below. "Owning" a product means:

- Understanding the codebase and being able to run it locally
- Opening pull requests with new features, bug fixes, or improvements
- Ensuring CI passes on all your PRs before requesting review
- Collaborating with Natan and the broader Anote team on product direction
- Participating in the Thursday Product Standup with updates on your product

Your research paper should ideally be informed by or applied to your product area — but this is flexible. Discuss with Natan.

---

## Product Repository Table

| Product | Repo | Live URL | Stack | Setup Method | CI/CD | Status |
|---------|------|----------|-------|-------------|-------|--------|
| MLOps Platform (OpenAnote) | [anote-ai/OpenAnote](https://github.com/anote-ai/OpenAnote) | dashboard.anote.ai | Python / React | `docker-compose` + `requirements.txt` | GitHub Actions | Production |
| Panacea (Autonomous Intelligence) | [anote-ai/Autonomous-Intelligence](https://github.com/anote-ai/Autonomous-Intelligence) | chat.anote.ai | Python / React | `docker-compose` + `pyproject.toml` | GitHub Actions | Production |
| Armor (Community) | [anote-ai/Community](https://github.com/anote-ai/Community) | community.anote.ai | React | `npm install` | GitHub Actions | Production |
| Model Leaderboard | [anote-ai/Leaderboard](https://github.com/anote-ai/Leaderboard) | anote.ai/leaderboard | Python / React | `docker-compose` | GitHub Actions | POC |
| Synthetic Data | [anote-ai/Synthetic-Data](https://github.com/anote-ai/Synthetic-Data) | anote.ai/syntheticdata | Python / React | `docker-compose` | GitHub Actions | POC |
| Private Chatbot (PrivateGPT) | [anote-ai/PrivateGPT](https://github.com/anote-ai/PrivateGPT) | anote.ai/downloadprivategpt | Electron / Python | `npm install` + `pip install` | GitHub Actions | POC |
| Slackbot | [anote-ai/Slackbot](https://github.com/anote-ai/Slackbot) | — | Python | `pip install` / `docker` | GitHub Actions | In Dev |
| AI RFPs | [anote-ai/AI-RFPs](https://github.com/anote-ai/AI-RFPs) | — | Python | `pip install` | GitHub Actions | In Dev |
| Upreach | [anote-ai/Upreach](https://github.com/anote-ai/Upreach) | — | Python / React | `docker-compose` | GitHub Actions (full deploy) | In Dev |
| AI Assisted Coding Tool | [anote-ai/AI-Assisted-Coding-Tool](https://github.com/anote-ai/AI-Assisted-Coding-Tool) | — | Node / Python / Rust | `npm install` + `pip install` | GitHub Actions | Production |

---

## Quick Start Guide (All Fellows)

Follow these steps to get your assigned product running locally on Day 1.

### Step 1: Clone the repo

```bash
git clone https://github.com/anote-ai/<your-repo>.git
cd <your-repo>
```

### Step 2: Set up your environment file

```bash
cp .env.example .env
# Edit .env and fill in the required secrets
# Ask Natan or PM (Rajshri) for any credentials you need
```

### Step 3: Start the application

**For docker-compose repos** (OpenAnote, Autonomous-Intelligence, Leaderboard, Synthetic-Data, Upreach):
```bash
docker-compose up --build
# Then open http://localhost:<port> in your browser
```

**For npm repos** (Community, PrivateGPT, AI-Assisted-Coding-Tool):
```bash
npm install
npm run dev
# Then open http://localhost:3000 in your browser
```

**For pip/Python repos** (Slackbot, AI-RFPs):
```bash
python -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate
pip install -r requirements.txt
python main.py
```

### Step 4: Verify it runs

Open the listed port in your browser and confirm the app loads. If it doesn't, check the README in your repo or ask in Slack #product.

### Step 5: Make your first commit

Before writing any feature code, make a small "hello" commit to confirm your setup:
```bash
git checkout -b fellows/<your-name>/setup
# Make a small change (e.g., add your name to CONTRIBUTORS.md)
git add .
git commit -m "chore: fellow setup - <your name>"
git push origin fellows/<your-name>/setup
# Open a PR — CI should run automatically
```

---

## How CI/CD Works

### Pull Requests

- Every PR triggers a GitHub Actions CI run
- CI typically runs: linting, unit tests, and build checks
- **PRs cannot be merged if CI is failing** — fix all CI errors before requesting review
- Request review from Natan or a designated reviewer once CI is green

### Deployments

- Deploys happen **only from the `main` branch**
- Merging a PR to `main` triggers an automatic deployment to the live environment
- Never push directly to `main` — always go through a PR
- For Production repos, be especially careful: changes go live immediately after merge

### Secrets and Credentials

- All API keys, database URLs, and service credentials are stored as **GitHub Secrets** in each repo
- GitHub Actions uses these secrets at deploy time — you never need to hardcode credentials
- For local development, copy `.env.example` to `.env` and fill in values (ask PM/Natan for credentials)
- Never commit `.env` files or secrets to the repo

---

## AWS Deployment Architecture

Anote's production products run on AWS with the following architecture:

| Layer | AWS Service | Notes |
|-------|------------|-------|
| Backend API | ECS (Elastic Container Service) | Docker containers; auto-scaled |
| Frontend | S3 + CloudFront | Static files served via CDN |
| Database | RDS / DynamoDB (varies by product) | Managed database service |
| Secrets | GitHub Secrets → injected at deploy | Never in code |
| Domain | Route 53 + CloudFront | anote.ai and subdomains |

You do not need to manage AWS infrastructure directly. Your job is to write code, open PRs, and let CI/CD deploy it. If you encounter infrastructure issues, reach out to Natan.

---

## Detailed Repo Setup Instructions

Each repo contains a `CODEBASE_SETUP.md` file with step-by-step instructions specific to that product. Read your repo's setup doc thoroughly before your first standup.

| Repo | Detailed Setup Doc |
|------|-------------------|
| anote-ai/OpenAnote | [CODEBASE_SETUP.md](https://github.com/anote-ai/OpenAnote/blob/main/CODEBASE_SETUP.md) |
| anote-ai/Autonomous-Intelligence | [CODEBASE_SETUP.md](https://github.com/anote-ai/Autonomous-Intelligence/blob/main/CODEBASE_SETUP.md) |
| anote-ai/Community | [CODEBASE_SETUP.md](https://github.com/anote-ai/Community/blob/main/CODEBASE_SETUP.md) |
| anote-ai/Leaderboard | [CODEBASE_SETUP.md](https://github.com/anote-ai/Leaderboard/blob/main/CODEBASE_SETUP.md) |
| anote-ai/Synthetic-Data | [CODEBASE_SETUP.md](https://github.com/anote-ai/Synthetic-Data/blob/main/CODEBASE_SETUP.md) |
| anote-ai/PrivateGPT | [CODEBASE_SETUP.md](https://github.com/anote-ai/PrivateGPT/blob/main/CODEBASE_SETUP.md) |
| anote-ai/Slackbot | [CODEBASE_SETUP.md](https://github.com/anote-ai/Slackbot/blob/main/CODEBASE_SETUP.md) |
| anote-ai/AI-RFPs | [CODEBASE_SETUP.md](https://github.com/anote-ai/AI-RFPs/blob/main/CODEBASE_SETUP.md) |
| anote-ai/Upreach | [CODEBASE_SETUP.md](https://github.com/anote-ai/Upreach/blob/main/CODEBASE_SETUP.md) |
| anote-ai/AI-Assisted-Coding-Tool | [CODEBASE_SETUP.md](https://github.com/anote-ai/AI-Assisted-Coding-Tool/blob/main/CODEBASE_SETUP.md) |

---

## Questions?

- **Product setup issues:** Post in Slack #product or ask at Thursday Product Standup
- **Repo access:** DM Rajshri (PM) or Natan on Slack
- **CI/CD failures you can't debug:** Tag Natan in your PR
- **Credentials / secrets:** DM Rajshri — never ask for secrets in public channels
