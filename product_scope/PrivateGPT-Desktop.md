# Private Chatbot — PrivateGPT Desktop

**Repo:** [anote-ai/PrivateGPT-Desktop](https://github.com/anote-ai/PrivateGPT-Desktop) · Public
**Live:** [anote.ai/downloadprivategpt](https://anote.ai/downloadprivategpt) | **Status:** POC

---

## What It Does

PrivateGPT Desktop is a **cross-platform Electron desktop app** providing a private, locally-running AI chatbot focused on financial document analysis. No data leaves the user's machine by default.

### Three Chatbot Modes

| Mode | Description |
|---|---|
| **PDF Mode** | Upload PDFs → chunked + embedded in local Chroma vector DB → semantic search + LLM answers |
| **EDGAR Mode** | Enter a stock ticker → fetches 10-K filings from SEC EDGAR → answers financial questions |
| **API Key Mode** | User provides their own OpenAI API key for direct cloud LLM queries |

### Document Processing Pipeline
PDF → PyPDF2 extraction → 1000-char chunks → Chroma embeddings → semantic search → top-K chunks → LLM prompt → response

---

## Tech Stack

### Backend (Python)
| Component | Technology |
|---|---|
| Framework | Flask 2.0.3 + Flask-CORS |
| Database | SQLite3 (local dev), MySQL (production) |
| Vector DB | Chroma (parquet-based embeddings) |
| Local LLMs | Ollama — Llama2, Mistral |
| Cloud LLM | OpenAI API |
| PDF | PyPDF2 |
| Financial | sec_api (SEC EDGAR) |
| Packaging | PyInstaller (standalone executable) |

### Frontend (JavaScript)
| Component | Technology |
|---|---|
| Framework | React 18.2.0 |
| State | Redux Toolkit + Redux Persist |
| Styling | Tailwind CSS 3.3.3 + Material-UI 5 |
| HTTP | Axios + socket.io-client |
| Animations | Framer Motion |
| PDF viewing | react-pdf |

### Desktop Shell
| Component | Technology |
|---|---|
| Shell | Electron 28.2.0 + Electron Forge |
| Distribution | Windows (Squirrel), macOS (DMG), Linux (DEB, RPM) |

**Language split:** JavaScript 61.4%, Python 32.8%, CSS 5.2%

---

## How to Run

### Prerequisites
- Python 3.x + virtualenv
- Node.js + npm
- [Ollama](https://ollama.ai) installed

### 1. Install Local Models (one-time)
```bash
ollama run llama2
ollama run mistral
```

### 2. Backend
```bash
cd backend
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt
python app.py       # http://127.0.0.1:5000 — must be free; Ollama must be running
```

### 3. Frontend
```bash
cd frontend
npm install --force   # --force required for peer dep conflicts
npm start             # http://localhost:3000
```

### 4. Electron Desktop App (dev)
```bash
npm install && npm start   # from repo root
```

### 5. Build Distributable
```bash
cd backend && pyinstaller app.spec          # → backend/dist/app
cd frontend && npm run build                # → frontend/build/
# Copy both into appdist/ then:
npm run make                                 # creates platform installer
```

---

## TODOs & Enhancements

### Critical Security Fixes
- [ ] **Move hardcoded secrets to `.env`** — `backend/constants/global_constants.py` has DB credentials; `chatbot_endpoints.py` has a hardcoded `sec_api` key
- [ ] **Fix `USER_ID = 1` hardcoding** — replace with proper JWT-based multi-user session handling

### Features
- [ ] **Complete multi-user support** — remove the `USER_ID = 1` placeholder throughout the backend
- [ ] **More Ollama models** — add model picker for Mixtral, Phi-3, Gemma
- [ ] **Document collections** — organize PDFs into named workspaces; chat across collections
- [ ] **Chat export** — export conversation history to PDF, Markdown, or JSON
- [ ] **Streaming responses** — stream tokens as they're generated (currently waits for full response)
- [ ] **SEC EDGAR expansion** — support 10-Q filings, earnings transcripts, 8-K filings
- [ ] **Auto-update** — use Electron's built-in auto-updater for new version delivery
- [ ] **Offline mode indicator** — clearly show when fully offline vs. using cloud APIs

### Improvements
- [ ] **Add tests** — only a single React smoke test; add Flask endpoint and embedding pipeline tests
- [ ] **Add CI/CD** — GitHub Actions for linting and build verification
- [ ] **Dockerize dev environment** — simplify onboarding with `docker-compose.yml`
- [ ] **Resolve `--force` npm install** — fix peer dependency conflicts in `frontend/package.json`
- [ ] **Document build pipeline** — the multi-step PyInstaller + Electron Forge build needs clear README docs with troubleshooting tips
