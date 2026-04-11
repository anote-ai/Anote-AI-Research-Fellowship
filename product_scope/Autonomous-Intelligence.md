# Panacea — Autonomous Intelligence

**Repo:** [anote-ai/Autonomous-Intelligence](https://github.com/anote-ai/Autonomous-Intelligence) · Public · Apache 2.0
**Live:** [chat.anote.ai](https://chat.anote.ai) | **Status:** Production | Stars: 31 · Forks: 13

---

## What It Does

Autonomous Intelligence (branded **Panacea**) is an open-source framework and deployable product for building collaborative multi-agent AI systems. Multiple specialized agents operate independently but coordinate through defined pathways, with an orchestrator managing task distribution.

It is both a **deployable web product** (chat UI + backend API at chat.anote.ai) and a **reusable Python SDK** for external developers.

### Core Abstractions
| Abstraction | Role |
|---|---|
| Orchestrator | Central hub managing task assignment and agent interactions |
| Agent | Autonomous units executing tasks and communicating with peers |
| Task | Specific assignments with descriptions and tool requirements |
| Crew | Collaborative groups of agents sharing objectives |
| Workflows | Sequential or hierarchical execution frameworks |
| Models | Pluggable LLM backends (GPT, Claude, Mistral, Gemini, Llama) |
| Tools | Functional capabilities: search, data extraction, file operations |

### Practical Use Cases
- AI-assisted coding (automating feature development)
- RFP / grant proposal automation
- Outreach and email campaign automation
- Job application automation (resume customization)
- Financial document analysis (10-K filings via FinanceGPT)

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | Python / Flask 2.0.3, Flask-JWT-Extended, Flask-SocketIO (real-time streaming) |
| Multi-Agent | LangChain (≥0.2), LangGraph (≥0.3.6) — state machine-based agent graphs |
| LLM Support | OpenAI SDK, Anthropic SDK, HuggingFace Transformers, Sentence-Transformers |
| Parallelism | Ray (≥2.9.0) |
| Database | MySQL 8.0 |
| Cache / Queue | Redis 7 |
| Document Processing | Apache Tika, PyPDF2, python-docx, BeautifulSoup4, pandas |
| Payments | Stripe 5.5.0 |
| Auth | Flask-JWT-Extended, Google OAuth |
| Frontend | React, Tailwind CSS, Node 20 |
| Infrastructure | Docker Compose (5 services), Makefile |
| Evaluation | RAGAS (≥0.2.0) for RAG pipeline quality |
| Quality | ruff, mypy, pytest + pytest-cov, pre-commit hooks |

---

## How to Run

### Option A — Docker (Recommended)
```bash
cp backend/.env.example backend/.env
docker compose up --build
```
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000
- MySQL: localhost:3307 · Redis: localhost:6380 · Tika: localhost:9999

### Option B — Native
```bash
# Frontend
cd frontend && cp .env.example .env.local
npm install && npm start

# Backend
cd backend && python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt && cp .env.example .env
export FLASK_APP=app.py FLASK_ENV=development FLASK_DEBUG=1
flask run --host=0.0.0.0 --port=5000

# Database
mysql -u root -p -e "create database agents;"
cd backend/database && python init_db_dev.py
```

### Tests
```bash
pytest                 # backend
npm run test:ci        # frontend
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Agent observability dashboard** — visualize agent execution traces, tool calls, and reasoning steps in real time
- [ ] **Persistent agent memory** — long-term vector DB per user so agents remember past sessions
- [ ] **Agent failure recovery** — retry logic and graceful degradation when a sub-agent fails mid-workflow
- [ ] **Rate limiting & quota enforcement** — per-user token/request limits to prevent runaway agent loops

### Features
- [ ] **Custom agent builder UI** — let users configure new agent types without writing code
- [ ] **Agent marketplace / registry** — shareable, versioned agent definitions the community can publish
- [ ] **Structured output enforcement** — force agents to return validated JSON schemas for downstream tool use
- [ ] **Multi-modal agents** — process images, PDFs, and audio (not just text)
- [ ] **Human-in-the-loop approval** — let users approve agent actions before execution (especially writes)
- [ ] **Workflow versioning** — track and replay prior agent workflow executions

### Improvements
- [ ] **Increase test coverage** — integration tests for the LangGraph state machine and streaming callbacks
- [ ] **RAGAS metrics in UI** — surface answer relevance and faithfulness scores per response
- [ ] **OpenAPI spec** — auto-generate API documentation from Flask endpoints
- [ ] **Frontend code splitting** — lazy-load routes to reduce initial bundle size
- [ ] **Streaming progress indicators** — per-agent step progress bars in the chat UI
