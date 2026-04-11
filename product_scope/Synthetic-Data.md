# Synthetic Data

**Repo:** [anote-ai/Synthetic-Data](https://github.com/anote-ai/Synthetic-Data) · Public
**Live:** [anote.ai/syntheticdata](https://anote.ai/syntheticdata) | **Status:** POC

---

## What It Does

**SyntheticDataGen** is Anote's SDK and API for programmatic synthetic dataset generation across multiple modalities. It replaces slow manual annotation with a single `generate(...)` call that produces schema-validated, QA-checked, benchmark-ready datasets.

### Supported Modalities

| Modality | Description |
|---|---|
| **Text** | Classification, NER, chatbot Q&A pairs, structured extraction |
| **Image** | Object detection with bounding boxes (DALL-E 3 + YOLO11) |
| **Video** | `.mp4` clips + JSON metadata (Replicate API) |
| **Audio** | `.wav` files + transcripts via faster-Whisper |
| **PII** | 14 PII types (name, SSN, credit card, etc.) — async, Faker-backed |
| **Language** | Japanese Q&A pairs from Japanese Wikipedia via GPT-4 |
| **Agents** | Placeholder for agent trace generation (tool calls, observations) |

### Multi-Layer QA Pipeline
Heuristic checks → LLM spot-check review → regeneration of failures → benchmark comparison

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | Python / Flask (`POST /public/generate`) |
| Alt API | FastAPI (experimental rewrite in `other/api/`) |
| LLM | OpenAI SDK — GPT-4o-mini, GPT-4, DALL-E 3; async via `AsyncOpenAI` |
| Video | Replicate API (Cog model) |
| Audio | faster-whisper (GPU float16 / CPU int8) |
| Vision | Ultralytics YOLO11 |
| PII | Faker library |
| Concurrency | asyncio + Semaphore (5 concurrent LLM calls by default) |
| Database | MySQL (job/request logging) |
| Frontend | React 18.2, Axios |
| SDK | `anote-generate` v0.20 (pip installable) |
| Docs | MkDocs |

---

## How to Run

### Backend
```bash
cd server
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt

# Create .env (no .env.example yet):
# OPENAI_API_KEY=sk-...
# REPLICATE_API_TOKEN=r8_...

python app.py    # http://localhost:5000
```

### Frontend
```bash
cd frontend
npm install && npm start    # http://localhost:3000
```

### SDK
```bash
cd server/sdk && pip install -e .
```
```python
from anote_generate import Anote
client = Anote(api_key="your-key")
result = client.generate(
    task_type="pii",
    columns=["name", "ssn", "email"],
    num_rows=100
)
```

### Tests
```bash
cd server && pytest tests/   # requires real API keys (no mocking yet)
```

---

## Known Issues

| Issue | Severity |
|---|---|
| Replicate API token hardcoded in `video.py:24` | 🔴 High |
| JWT auth decorator commented out in `app.py` | 🔴 High |
| `text.py` generator returns mock stub data only | 🔴 High |
| `db.py` database helpers are incomplete stubs | 🟡 Medium |
| No `.env.example` | 🟡 Medium |
| OpenAI key falls back to a local file path in `Language.py` | 🟡 Medium |

---

## TODOs & Enhancements

### Critical Fixes
- [ ] **Move Replicate token to `.env`** — hardcoded in `video.py:24`
- [ ] **Re-enable JWT auth** — `@valid_api_key_required` is commented out
- [ ] **Implement `text.py` generator** — currently returns mock stub data
- [ ] **Create `.env.example`** — document all required env vars
- [ ] **Complete `db.py`** — finish the persistence layer stubs

### Features
- [ ] **Streaming generation** — stream rows as they're generated rather than waiting for the full batch
- [ ] **Async job tracking** — job IDs so clients can poll or receive webhooks on large batches
- [ ] **Dataset versioning** — track and diff generated dataset versions
- [ ] **Quality metrics dashboard** — expose QA scores (schema pass rate, LLM review rate) in the UI
- [ ] **More text task types** — summarization pairs, instruction-following, chain-of-thought
- [ ] **Deploy FastAPI rewrite** — `other/api/` is cleaner with Pydantic schemas; migrate and deploy it

### Improvements
- [ ] **Mock external APIs in tests** — add `unittest.mock` fixtures so tests don't need live keys
- [ ] **Add CI/CD** — GitHub Actions for lint, mypy, and tests
- [ ] **Dockerize** — `docker-compose.yml` for Flask + MySQL
- [ ] **Rate limiting** — per-API-key limits on the generation endpoint
