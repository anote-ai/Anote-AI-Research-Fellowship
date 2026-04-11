# Model Leaderboard

**Repo:** [anote-ai/Leaderboard](https://github.com/anote-ai/Leaderboard) · Public
**Live:** [anote.ai/leaderboard](https://anote.ai/leaderboard) | **Status:** POC

---

## What It Does

The Anote Model Leaderboard is a **community-driven AI model benchmarking and evaluation platform** where teams can submit model results, browse rankings, add benchmark datasets, and run batch CSV evaluations across multiple LLM providers.

The platform is **database-optional** — all core features gracefully degrade to in-memory operation.

### Supported Task Types
Text classification · Named Entity Recognition · Document Q&A · Line-level Q&A · Multilingual translation (Spanish, Arabic, Asian scripts)

### Model Providers
OpenAI (GPT-4o, GPT-4o Mini) · Anthropic (Claude) · Google (Gemini) · xAI (Grok) · Ollama (local) · HuggingFace (LLaMA3, Mistral)

### Evaluation Metrics
- **Translation:** BLEU + BERTScore (semantic)
- **Classification:** Accuracy or Macro-F1
- **NER:** Set-based Macro-F1
- **QA:** Exact match or token-overlap F1

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | Python 3.8+, Flask 2.3+, flask-cors |
| Database | MySQL (optional — auto-falls back to in-memory) |
| Evaluation | NLTK (BLEU), bert-score (optional) |
| Model SDKs | openai, anthropic, google-generativeai, requests (Ollama/XAI) |
| Local LLMs | HuggingFace Transformers + PyTorch (optional) |
| Frontend | React 18.3.1 (Create React App) |
| State | Redux Toolkit + Zustand |
| UI | Material-UI v5, Flowbite React, Tailwind CSS |
| Visualization | D3.js + React D3 Components |
| File Handling | Uppy, PapaParse (CSV parsing) |
| Language | JavaScript 44%, CSS 36%, Python 19% |

---

## How to Run

### Backend
```bash
cd backend
pip install -r requirements.txt
# Required: Flask>=2.3, flask-cors>=4.0, requests>=2.31, nltk>=3.8

PORT=5001 python app.py   # use 5001 on macOS (5000 is reserved by AirPlay)
```

**Optional env vars:**
```
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
GOOGLE_API_KEY=...
OLLAMA_BASE_URL=http://localhost:11434
DB_HOST / DB_USER / DB_PASSWORD / DB_NAME / DB_PORT
FLASK_ENV=development
ALLOWED_ORIGINS=*
```

### Frontend
```bash
cd frontend
npm install
REACT_APP_API_ENDPOINT=http://localhost:5001 npm start
```

### Tests
```bash
cd backend && python -m pytest pytest/
```

---

## Key API Endpoints

| Method | Path | Purpose |
|---|---|---|
| GET | `/health` | Health check |
| GET | `/public/get_leaderboard` | Ranked model scores |
| GET | `/public/datasets` | List benchmark datasets |
| GET | `/public/benchmark_csvs` | List available CSV benchmarks |
| POST | `/public/submit_model` | Submit model results |
| POST | `/public/add_dataset` | Add a benchmark dataset |
| POST | `/public/run_csv_benchmarks` | Batch evaluate models on CSV files |

---

## TODOs & Enhancements

### High Priority
- [ ] **Add authentication** — all submission endpoints are open; add API key auth to prevent spam
- [ ] **Add `.env.example`** — document all optional API key and DB variables
- [ ] **Persist CSV benchmark results** — save batch results to DB for historical comparison
- [ ] **Expand test coverage** — tests for BLEU/BERTScore/F1 scoring functions
- [ ] **Add CI/CD** — GitHub Actions for lint, tests, Docker build

### Features
- [ ] **Live model comparison view** — side-by-side comparison of models on the same dataset
- [ ] **Per-dataset leaderboard pages** — individual leaderboard per dataset (not just global)
- [ ] **Confidence intervals / error bars** — show statistical significance of score differences
- [ ] **Model cards** — rich detail pages per model (architecture, parameter count, known limitations)
- [ ] **Embed widget** — shareable iframe for embedding the leaderboard in blog posts or papers
- [ ] **Public JSON API** — let other tools consume leaderboard rankings programmatically
- [ ] **Trending section** — highlight newly submitted models to drive community engagement

### Improvements
- [ ] **Consolidate state management** — app uses both Redux and Zustand; pick one
- [ ] **Dockerize** — `docker-compose.yml` for full stack (backend + MySQL + frontend)
- [ ] **Migrate from Create React App** — CRA is unmaintained; move to Vite
- [ ] **Mobile-responsive D3 charts** — visualizations need responsive sizing for small screens
