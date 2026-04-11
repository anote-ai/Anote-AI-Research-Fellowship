# Synthetic Data — Product Summary

**Repo:** [anote-ai/Synthetic-Data](https://github.com/anote-ai/Synthetic-Data)
**Live:** [anote.ai/syntheticdata](https://anote.ai/syntheticdata) | **Status:** POC

---

## What It Does

**SyntheticDataGen** is Anote's SDK and API for programmatic synthetic dataset generation, curation, labeling, and evaluation across multiple data modalities. It replaces the slow, expensive manual annotation pipeline with a single `generate(...)` call that produces schema-validated, QA-checked, benchmark-ready datasets.

### Supported Modalities

| Modality | Description |
|---|---|
| **Text** | Classification (sentiment), NER (PII tagging), chatbot Q&A pairs, structured extraction |
| **Image** | Object detection with bounding boxes (DALL-E 3 generation + YOLO11 detection) |
| **Video** | `.mp4` clips + JSON metadata (Replicate API / Cog model) |
| **Audio** | `.wav` files + transcripts via faster-Whisper (TTS/ASR) |
| **PII** | 14 PII types (name, SSN, credit card, etc.) — async/concurrent, Faker-backed |
| **Language** | Japanese Q&A pairs sourced from Japanese Wikipedia via GPT-4 |
| **Agents** | Placeholder for agent trace generation (tool calls, actions, observations) |

### Key Value Propositions
- Coverage of long-tail edge cases
- Privacy-safe (PII-free surrogates)
- Reproducible via seeds
- Multi-layer QA: heuristics → LLM review → benchmark comparison

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | Python / Flask (primary REST API at `POST /public/generate`) |
| Alt API | FastAPI (experimental rewrite in `other/api/`, Pydantic schemas) |
| LLM | OpenAI SDK (`openai==1.93.0`) — GPT-4o-mini, GPT-4, DALL-E 3; async via `AsyncOpenAI` |
| Video | Replicate API (Cog model) |
| Audio | faster-whisper (GPU float16 or CPU int8 auto-detected) |
| Vision / Detection | Ultralytics YOLO11 |
| PII | Faker library |
| Data | pandas, numpy |
| Validation | pydantic 2.x (FastAPI layer) |
| Concurrency | asyncio + Semaphore (default: 5 concurrent LLM calls) |
| Database | MySQL (job/request logging) |
| Frontend | React 18.2 (CRA), Axios |
| SDK | `anote-generate` v0.20 (pip installable) |
| Docs | MkDocs (in `frontend/src/docs/`) |

---

## How to Run

### Backend (Flask)
```bash
cd server
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Create .env manually (no .env.example exists yet):
# OPENAI_API_KEY=sk-...
# REPLICATE_API_TOKEN=r8_...

python app.py    # Runs on http://localhost:5000
```

### Frontend (React)
```bash
cd frontend
npm install
npm start        # http://localhost:3000 — calls localhost:5000
```

### Python SDK
```bash
cd server/sdk
pip install -e .
```

```python
from anote_generate import Anote

client = Anote(api_key="your-key")
result = client.generate(
    task_type="text",          # text, image, video, audio, pii, language
    columns=["question", "answer"],
    prompt="Generate diverse FAQ pairs about machine learning",
    num_rows=100,
    examples=[{"question": "What is gradient descent?", "answer": "..."}]
)
```

### Tests
```bash
cd server
pytest tests/     # Note: requires real API keys (no mocking)
```

---

## Known Issues (from CLAUDE.md)

| Issue | Severity |
|---|---|
| Replicate API token hardcoded in `video.py:24` | High |
| JWT auth decorator commented out in `app.py` | High |
| `text.py` generator returns mock stub data only | High |
| `setup.py` has hardcoded local developer path | Medium |
| `db.py` database helpers are incomplete stubs | Medium |
| OpenAI key falls back to a local file path in `Language.py` | Medium |
| No `.env.example` | Low |

---

## TODOs & Enhancements

### Critical Fixes
- [ ] **Move Replicate API token to `.env`** — currently hardcoded in `video.py:24`
- [ ] **Enable JWT auth** — the `@valid_api_key_required` decorator is commented out; re-enable before production
- [ ] **Implement `text.py` generator** — currently returns mock stub data; implement real GPT-4-based text generation
- [ ] **Create `.env.example`** — document all required env vars (OpenAI, Replicate, DB)
- [ ] **Complete `db.py` database helpers** — currently stubs; finish persistence layer

### Features
- [ ] **Streaming generation endpoint** — stream rows as they are generated rather than waiting for the full batch
- [ ] **Generation job tracking** — async job IDs so clients can poll or receive webhooks on large batch completion
- [ ] **Dataset versioning** — track and diff generated dataset versions
- [ ] **Quality metrics dashboard** — expose QA scores (schema pass rate, LLM review pass rate) per generation job in the UI
- [ ] **More text task types** — extend text generator to support summarization pairs, instruction-following, chain-of-thought
- [ ] **Expand agent trace generation** — implement the placeholder agent modality with real ReAct-style traces
- [ ] **Deploy FastAPI rewrite** — the `other/api/` FastAPI implementation is cleaner; migrate and deploy it as the primary API

### Improvements
- [ ] **Add API mocking to tests** — current tests require live OpenAI/Replicate keys; add `unittest.mock` fixtures
- [ ] **Add CI/CD** — GitHub Actions for lint, type check (mypy), and tests
- [ ] **Dockerize** — add `docker-compose.yml` for one-command local setup (Flask + MySQL)
- [ ] **Rate limiting** — add per-API-key rate limits to the generation endpoint
