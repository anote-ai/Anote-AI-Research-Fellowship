# Panacea (Autonomous Intelligence) — Product Summary

**Repo:** [anote-ai/Autonomous-Intelligence](https://github.com/anote-ai/Autonomous-Intelligence)
**Live:** [chat.anote.ai](https://chat.anote.ai) | **Status:** Production
**License:** Apache 2.0

---

## What It Does

Autonomous Intelligence (branded **Panacea**) is an open-source framework and deployable product for building collaborative multi-agent AI systems. Multiple specialized AI agents operate independently but coordinate through defined communication pathways, with an orchestrator managing task distribution.

It is both:
- A **deployable web product** — chat UI + backend API at chat.anote.ai
- A **reusable Python SDK** — for external developers to embed Anote agents into their own apps

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
| Auth | Flask-JWT-Extended, Google OAuth, Google API client |
| Frontend | React (Create React App), Tailwind CSS, Node 20 |
| Infrastructure | Docker Compose (5 services), Makefile |
| Evaluation | RAGAS (≥0.2.0) for RAG pipeline evaluation |
| Quality | ruff, mypy, pytest + pytest-cov, pre-commit hooks |

---

## How to Run

### Option A — Docker (Recommended)
```bash
cp backend/.env.example backend/.env
docker compose up --build
```
Services:
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000
- MySQL: localhost:3307
- Redis: localhost:6380
- Apache Tika: http://localhost:9999

### Option B — Native Development
**Frontend:**
```bash
cd frontend
cp .env.example .env.local
npm install
npm start
```

**Backend:**
```bash
cd backend
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
export FLASK_APP=app.py FLASK_ENV=development FLASK_DEBUG=1
flask run --host=0.0.0.0 --port=5000
```

**Database:**
```bash
mysql -u root -p
# > create database agents;
cd backend/database
python init_db_dev.py
```

### Testing
```bash
# Backend
pytest

# Frontend
npm run test:ci
npm run build
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Agent observability dashboard** — Visualize agent execution traces, tool calls, and reasoning steps in real time in the UI
- [ ] **Persistent agent memory** — Add long-term memory store (e.g., vector DB per user) so agents remember past sessions
- [ ] **Agent failure recovery** — Implement retry logic and graceful degradation when a sub-agent fails mid-workflow
- [ ] **Rate limiting & quota enforcement** — Per-user token/request limits to prevent runaway agent loops

### Features
- [ ] **Custom agent builder UI** — Let users create and configure new agent types without writing code
- [ ] **Agent marketplace / registry** — Shareable, versioned agent definitions that the community can publish and reuse
- [ ] **Structured output enforcement** — Force agents to return validated JSON schemas for downstream tool use
- [ ] **Multi-modal agents** — Allow agents to process images, PDFs, and audio (not just text)
- [ ] **Human-in-the-loop approval step** — Let users review and approve agent actions before execution (especially for write operations)
- [ ] **Workflow versioning** — Track and replay prior agent workflow executions

### Improvements
- [ ] **Increase test coverage** — Add integration tests for the multi-agent LangGraph state machine and streaming callback handlers
- [ ] **Frontend performance** — Lazy-load agent workflow components; large bundles slow initial page load
- [ ] **RAGAS evaluation pipeline** — Surface RAG quality metrics (answer relevance, faithfulness) in the UI
- [ ] **Improve SDK documentation** — Add end-to-end quickstart examples and a `docs/` site with agent building tutorials
- [ ] **OpenAPI spec** — Auto-generate API documentation from Flask endpoints
- [ ] **Streaming progress indicators** — Show per-agent step progress bars in the chat UI (not just final results)
