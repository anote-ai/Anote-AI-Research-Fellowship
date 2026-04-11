# Model Leaderboard — Product Summary

**Repo:** [anote-ai/Leaderboard](https://github.com/anote-ai/Leaderboard)
**Live:** [anote.ai/leaderboard](https://anote.ai/leaderboard) | **Status:** POC

---

## What It Does

The Anote Model Leaderboard is a **community-driven AI model benchmarking and evaluation platform**. It enables teams to:

- **Submit** model results across multiple NLP task types (text classification, NER, document Q&A, line-level Q&A, multilingual translation)
- **Browse** a ranked leaderboard of models scored against curated benchmark datasets
- **Add** new benchmark datasets to the platform
- **Run batch CSV benchmarks** — automatically evaluate multiple models (OpenAI, Anthropic, Google, Ollama, local functions) against local CSV files

The platform is designed to be **database-optional**: all core features gracefully degrade to in-memory operation with no database required.

### Supported Model Providers
OpenAI (GPT-4o, GPT-4o Mini), Anthropic (Claude), Google (Gemini), xAI (Grok), Ollama (local), Hugging Face (LLaMA3, Mistral)

### Evaluation Metrics (task-aware)
- **Translation:** BLEU (Spanish/Arabic) + BERTScore (semantic, especially for Asian scripts)
- **Text Classification:** Accuracy or Macro-F1
- **NER:** Set-based Macro-F1 across predicted vs. reference entity lists
- **QA/Chatbot:** Exact match or token-overlap F1

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | Python 3.8+, Flask 2.3+, flask-cors |
| Database | MySQL (fully optional — auto-falls back to in-memory dicts) |
| Evaluation | NLTK (BLEU), bert-score (BERTScore, optional) |
| Model SDKs | openai, anthropic, google-generativeai, requests (Ollama/XAI) |
| Local LLMs | HuggingFace Transformers + PyTorch (optional) |
| Frontend | React 18.3.1 (Create React App) |
| State | Redux Toolkit + Zustand |
| UI | Material-UI v5, Flowbite React, Tailwind CSS |
| Visualization | D3.js + React D3 Components |
| File Handling | Uppy, PapaParse (CSV), React-PDF |
| Language split | JavaScript 44%, CSS 36.2%, Python 19.3% |

---

## How to Run

### Backend
```bash
cd backend
pip install -r requirements.txt
# Required: Flask>=2.3, flask-cors>=4.0, requests>=2.31, nltk>=3.8
# Optional: openai, anthropic, google-generativeai, bert-score, transformers, torch, pymysql

PORT=5001 python app.py   # Use 5001 on macOS (port 5000 is reserved by AirPlay)
```

**Environment variables (all optional):**
```bash
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
GOOGLE_API_KEY=...
XAI_API_KEY=...
OLLAMA_BASE_URL=http://localhost:11434
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=...
DB_NAME=leaderboard
DB_PORT=3306
FLASK_ENV=development
ALLOWED_ORIGINS=*
```

### Frontend
```bash
cd frontend
npm install
REACT_APP_API_ENDPOINT=http://localhost:5001 npm start
```

Env file: `.env.development` / `.env.production` for API endpoint config.

### Tests
```bash
cd backend
python -m pytest pytest/
```

---

## Key API Endpoints

| Method | Path | Purpose |
|---|---|---|
| GET | `/health` | Health check with UTC timestamp |
| GET | `/public/datasets` | List active benchmark datasets |
| GET | `/public/get_leaderboard` | Ranked model scores |
| GET | `/public/benchmark_csvs` | List available CSV benchmark files |
| GET | `/public/benchmark_models` | List available model configs |
| POST | `/public/submit_model` | Submit model results + trigger scoring |
| POST | `/public/add_dataset` | Create new benchmark dataset |
| POST | `/public/run_csv_benchmarks` | Batch evaluate models on CSV files |

---

## TODOs & Enhancements

### High Priority
- [ ] **Add `.env.example`** — Document all optional API key and DB variables for contributors
- [ ] **Add authentication** — Currently all submission endpoints are open; add API key auth to prevent spam submissions
- [ ] **Expand test coverage** — Add tests for scoring functions (BLEU, BERTScore, F1) and the CSV benchmark pipeline
- [ ] **Persist CSV benchmark results** — Currently batch benchmark results are returned but not stored; save to DB for historical comparison
- [ ] **Add CI/CD pipeline** — GitHub Actions for lint, tests, and Docker build

### Features
- [ ] **Live model comparison view** — Side-by-side comparison of two or more models on the same dataset
- [ ] **Per-dataset leaderboard pages** — Individual leaderboard pages per dataset (not just a global ranking)
- [ ] **Confidence intervals / error bars** — Show statistical significance of score differences between models
- [ ] **User-submitted datasets with validation** — Validate schema and data quality before accepting community dataset submissions
- [ ] **Embed leaderboard widget** — Shareable iframe/widget for embedding the leaderboard in external blog posts or papers
- [ ] **Model cards** — Rich detail pages per model: architecture, parameter count, training data, known limitations
- [ ] **API leaderboard endpoint** — Public JSON API for the leaderboard so other tools can consume rankings programmatically
- [ ] **Trending / recently-added section** — Highlight newly submitted models to encourage community engagement

### Improvements
- [ ] **Remove dual state management** — App uses both Redux and Zustand; consolidate to one
- [ ] **Dockerize for easy deployment** — Add `docker-compose.yml` for full stack (backend + MySQL + frontend)
- [ ] **Mobile layout** — D3.js visualizations need responsive sizing for small screens
- [ ] **Upgrade from Create React App** — CRA is unmaintained; migrate to Vite for faster dev builds
