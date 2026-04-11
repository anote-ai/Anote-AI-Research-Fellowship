# Private Chatbot (PrivateGPT Desktop) — Product Summary

**Repo:** [anote-ai/PrivateGPT-Desktop](https://github.com/anote-ai/PrivateGPT-Desktop)
**Live:** [anote.ai/downloadprivategpt](https://anote.ai/downloadprivategpt) | **Status:** POC

---

## What It Does

PrivateGPT Desktop is a **cross-platform Electron desktop application** providing a private, locally-running AI chatbot focused on financial document analysis. No data leaves the user's machine by default (unless the user opts into the cloud API mode).

### Three Chatbot Modes

| Mode | Description |
|---|---|
| **PDF Mode** | Upload PDFs → chunked and embedded into local Chroma vector DB → semantic search + LLM answers |
| **EDGAR Mode** | Provide a stock ticker → app fetches 10-K filings from SEC EDGAR → answers financial questions |
| **API Key Mode** | User provides their own OpenAI API key for direct cloud LLM queries |

### Document Processing Pipeline
PDF upload → PyPDF2 text extraction → chunking (1000-char chunks) → Chroma vector embedding → stored in `backend/db/` → on query: semantic similarity search → top-K chunks → LLM prompt construction → streamed response

---

## Tech Stack

### Backend (Python)
| Component | Technology |
|---|---|
| Framework | Flask 2.0.3 + Flask-CORS |
| Database | SQLite3 (local dev), MySQL (production) |
| Vector DB | Chroma (parquet-based embeddings in `backend/db/`) |
| Local LLMs | Ollama — Llama2, Mistral |
| Cloud LLM | OpenAI API |
| Document | PyPDF2 |
| Financial data | sec_api (SEC EDGAR) |
| Packaging | PyInstaller (standalone executable) |

### Frontend (JavaScript)
| Component | Technology |
|---|---|
| Framework | React 18.2.0 |
| State | Redux Toolkit + Redux Persist |
| Styling | Tailwind CSS 3.3.3 + Material-UI 5 |
| HTTP | Axios |
| Animations | Framer Motion |
| Realtime | socket.io-client |
| PDF viewing | react-pdf |

### Desktop Shell
| Component | Technology |
|---|---|
| Shell | Electron 28.2.0 |
| Packaging | Electron Forge |
| Distribution | Windows (Squirrel), macOS (DMG), Linux (DEB, RPM) |

**Language split:** JavaScript 61.4%, Python 32.8%, CSS 5.2%, HTML 0.6%

---

## How to Run

### Prerequisites
- Python 3.x + `virtualenv`
- Node.js + npm
- [Ollama](https://ollama.ai) installed and running

### 1. Install Local LLMs (one-time)
```bash
ollama run llama2
ollama run mistral
```

### 2. Backend
```bash
cd backend
python -m venv venv
source venv/bin/activate        # Windows: venv\Scripts\activate
pip install -r requirements.txt
python app.py                   # Runs on http://127.0.0.1:5000
```
> **Note:** Port 5000 must be free. Ollama must be running before starting the backend.

### 3. Frontend
```bash
cd frontend
npm install --force             # --force required for peer dependency conflicts
npm start                       # Dev server at http://localhost:3000
```

### 4. Run as Electron Desktop App (dev)
```bash
# From repo root
npm install
npm start
```

### 5. Build Distributable Installer
```bash
# Step 1: Compile backend
cd backend && pyinstaller app.spec
# Output: backend/dist/app

# Step 2: Build frontend
cd frontend && npm run build
# Output: frontend/build/

# Step 3: Copy to appdist/
cp -r backend/dist/app appdist/
cp -r frontend/build appdist/

# Step 4: Package with Electron Forge
npm run make    # Creates platform-specific installer
```
> **Note:** `appdist/` is gitignored and must be populated before packaging.

---

## TODOs & Enhancements

### Critical Security Fixes
- [ ] **Move hardcoded secrets to `.env`** — `backend/constants/global_constants.py` contains hardcoded DB credentials; `backend/api_endpoints/financeGPT/chatbot_endpoints.py` contains a hardcoded `sec_api` key — move all to `.env` immediately
- [ ] **Fix hardcoded `USER_ID = 1`** — Multiple backend endpoints use a hardcoded single-user ID; implement proper multi-user session handling

### Features
- [ ] **Complete multi-user support** — Replace the `USER_ID = 1` placeholder with proper JWT-based session authentication throughout the backend
- [ ] **More local model options** — Add support for additional Ollama models (Mixtral, Phi-3, Gemma) via a model picker in the UI
- [ ] **Document collections** — Allow users to organize PDFs into named collections / workspaces and chat across collections
- [ ] **Chat export** — Export conversation history to PDF, Markdown, or JSON
- [ ] **Streaming responses** — Implement streaming token-by-token responses (currently waiting for full response before display)
- [ ] **Dark/light mode toggle** — Add user-controlled theme switching
- [ ] **SEC EDGAR expansion** — Support 10-Q filings, earnings call transcripts, and 8-K filings (not just 10-K)
- [ ] **Offline mode indicator** — Clearly display when operating in fully offline mode vs. using cloud APIs

### Improvements
- [ ] **Add tests** — Only a single React smoke test exists; add unit tests for Flask endpoints and the document chunking/embedding pipeline
- [ ] **Add CI/CD** — GitHub Actions for linting and build verification
- [ ] **Dockerize development environment** — Simplify onboarding with a `docker-compose.yml`
- [ ] **Improve build pipeline documentation** — The multi-step PyInstaller + Electron Forge build is complex; document it clearly in the README with troubleshooting tips
- [ ] **Auto-update mechanism** — Use Electron's built-in auto-updater to push new versions to existing installs
- [ ] **Reduce `npm install --force` requirement** — Resolve peer dependency conflicts in `frontend/package.json`
