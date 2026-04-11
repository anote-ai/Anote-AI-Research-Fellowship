# Slackbot

**Repo:** [anote-ai/Slackbot](https://github.com/anote-ai/Slackbot) · **Private**
**Status:** In Development | Language: Python | Size: ~721 KB | Last updated: March 2026

---

## What It Does

The Anote Slackbot is an **AI-powered Slack integration** that brings Anote's workflows directly into Slack — enabling teams to trigger annotation jobs, run Q&A queries against indexed documents, and receive AI-generated answers without leaving Slack.

### Intended Capabilities
- **Slash commands** — `/anote ask <question>` to query indexed documents
- **Annotation workflows** — trigger labeling jobs and receive completion notifications in Slack
- **Q&A via mentions** — `@AnoteBot what does the contract say about payment terms?`
- **Automated digests** — daily summaries of model performance and pending tasks
- **Human-in-the-loop** — send uncertain model predictions to a Slack channel for approve/reject

---

## Tech Stack

- **Language:** Python (primary)
- **Likely framework:** Slack Bolt for Python (`slack_bolt`) or `slack_sdk`
- **Stage:** Proof of concept

---

## How to Run

> This repo is private. Steps below follow standard Slack Python app patterns.

### Prerequisites
- Python 3.x
- A Slack App at [api.slack.com/apps](https://api.slack.com/apps) with:
  - Bot Token Scopes: `chat:write`, `commands`, `app_mentions:read`, `channels:history`
  - Event Subscriptions enabled with a Request URL pointing to your server

### Setup
```bash
git clone https://github.com/anote-ai/Slackbot
cd Slackbot
pip install -r requirements.txt
cp .env.example .env
# Set: SLACK_BOT_TOKEN, SLACK_SIGNING_SECRET, ANOTE_API_KEY
python app.py
```

### Local Development with ngrok
```bash
ngrok http 3000
# Paste the HTTPS URL into your Slack App's Event Subscriptions Request URL
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Write a README** — setup, required Slack app permissions, env vars, usage instructions
- [ ] **Add `.env.example`** — list all required env vars (Slack tokens, Anote API key, etc.)
- [ ] **Add tests** — unit tests for command handlers and event processors
- [ ] **Add CI/CD** — GitHub Actions for linting and testing

### Features
- [ ] **`/anote ask` slash command** — query Anote-indexed documents directly from Slack
- [ ] **`/anote label` command** — trigger a labeling job from Slack
- [ ] **Job completion notifications** — post a message when fine-tuning or labeling completes
- [ ] **Annotation approval workflow** — send uncertain predictions to Slack with approve/reject buttons (Block Kit)
- [ ] **Daily digest** — scheduled Slack post with model performance metrics and pending tasks
- [ ] **Multi-workspace support** — per-workspace OAuth configuration
- [ ] **Global shortcut** — quick-access shortcut menu for common Anote actions

### Improvements
- [ ] **Migrate to Slack Bolt** — use the official [Slack Bolt for Python](https://slack.dev/bolt-python/) for better event handling and middleware
- [ ] **Implement OAuth 2.0 flow** — enable "Add to Slack" button for self-service installation
- [ ] **Rate limiting** — respect Slack API rate limits with exponential backoff
- [ ] **Structured logging** — add `structlog` for production debugging
- [ ] **Docker deployment** — containerize for consistent deployment
