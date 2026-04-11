# Slackbot — Product Summary

**Repo:** [anote-ai/Slackbot](https://github.com/anote-ai/Slackbot) *(Private)*
**Status:** In Development

---

## What It Does

The Anote Slackbot is an **AI-powered Slack integration** that brings Anote's AI workflows directly into Slack. It enables teams to interact with Anote's annotation, Q&A, and AI features without leaving Slack — through slash commands, mentions, and automated notifications.

From the product description, key capabilities include:
- Triggering Anote annotation workflows from Slack
- Running Q&A queries against indexed documents via Slack messages
- Receiving notifications about labeling job completions and model training updates
- Automating repetitive AI-assisted tasks within team Slack channels

**Tech:** Python (primary language), proof-of-concept stage (~721 KB codebase, last updated March 2026).

---

## How to Run

> **Note:** This repo is private. The following is inferred from standard Slack app development patterns with Python.

### Prerequisites
- Python 3.x
- A Slack App configured at [api.slack.com](https://api.slack.com/apps) with:
  - Bot Token Scopes: `chat:write`, `commands`, `app_mentions:read`, `channels:history`
  - Event Subscriptions enabled
  - A Request URL pointing to your deployed server

### Setup
```bash
# Clone repo (requires org access)
git clone https://github.com/anote-ai/Slackbot
cd Slackbot

# Install dependencies
pip install -r requirements.txt

# Configure environment
cp .env.example .env
# Set: SLACK_BOT_TOKEN, SLACK_SIGNING_SECRET, ANOTE_API_KEY

# Run the bot
python app.py
```

### Local Development with ngrok
```bash
# Expose local server to Slack
ngrok http 3000
# Paste the HTTPS URL into your Slack App's Event Subscriptions Request URL
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Write a README** — Document setup, required Slack app permissions, and usage instructions
- [ ] **Add `.env.example`** — List all required environment variables (Slack tokens, Anote API key, etc.)
- [ ] **Add tests** — Unit tests for command handlers and event processors
- [ ] **Add CI/CD pipeline** — GitHub Actions for linting and testing

### Features
- [ ] **`/anote ask` slash command** — Query documents indexed in Anote directly from any Slack channel
- [ ] **`/anote label` command** — Trigger a labeling job for a given dataset from Slack
- [ ] **Job completion notifications** — Post a Slack message when a fine-tuning or labeling job completes
- [ ] **Annotation approval workflow** — Send uncertain annotations to a Slack channel for human review with approve/reject buttons
- [ ] **Daily digest** — Post a daily summary of model performance metrics and pending labeling tasks
- [ ] **Multi-workspace support** — Allow installation across multiple Slack workspaces with per-workspace configuration
- [ ] **Shortcut menu** — Add a Slack global shortcut for quick access to common Anote actions

### Improvements
- [ ] **Use Slack Bolt framework** — Migrate to the official [Slack Bolt for Python](https://slack.dev/bolt-python/) for better event handling, middleware, and OAuth support
- [ ] **Implement OAuth 2.0 flow** — Enable Slack App distribution / "Add to Slack" button for self-service installation
- [ ] **Rate limiting** — Respect Slack API rate limits and implement exponential backoff
- [ ] **Structured logging** — Add structured logging (e.g., structlog) for production debugging
- [ ] **Docker deployment** — Containerize the app for consistent deployment
