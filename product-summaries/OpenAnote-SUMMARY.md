# OpenAnote (MLOps Platform) — Product Summary

**Repo:** [anote-ai/OpenAnote](https://github.com/anote-ai/OpenAnote)
**Live:** [dashboard.anote.ai](https://dashboard.anote.ai/) | **Status:** Production
**License:** Apache 2.0

---

## What It Does

OpenAnote is an end-to-end MLOps platform for obtaining labeled data and comparing zero-shot large language models against fine-tuned models. It supports four core task types:

- **Text Classification** — categorize documents with LLM or fine-tuned models
- **Named Entity Recognition (NER)** — tag entities in text
- **Chatbot / RAG** — cross-document Q&A using Retrieval-Augmented Generation
- **Prompting** — per-document or line-level Q&A

The platform follows a 10-step human-in-the-loop AI workflow: Project Creation → Dataset Definition → Evaluation Metrics → Zero-Shot Predictions → Fine-Tuning → Labeling Strategies → Model Integration → Workflow Iteration → Final Reporting → API Access.

OpenAnote is the open-source reference version of the full product at [dashboard.anote.ai](https://dashboard.anote.ai/).

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | React, Redux, Zustand, Google OAuth |
| Backend | Python, Flask (60+ REST endpoints) |
| Database | MySQL (users, projects, datasets, annotations, predictions) |
| ML / LLMs | OpenAI (GPT-4, GPT-4 Mini), Anthropic (Claude), Meta (Llama3), Mistral, Google (Gemini), xAI (Grok), Groq |
| Fine-Tuning | Supervised fine-tuning with LoRA / QLoRA; RLHF / RLAIF |
| Distributed ML | Ray (GPU/CPU distributed training and prediction) |
| Infrastructure | AWS (S3, ECR, Elastic Beanstalk, CloudFront), Docker, Kubernetes/EKS |
| Document Parsing | Apache Tika |
| SDK | Python package `anoteai` (pip installable) |
| Docs | MkDocs (deployed to AWS S3) |

---

## How to Run

### Prerequisites
- Node.js, Python 3.10.13 (via conda), MySQL, JDK 8+ (for Apache Tika)

### Frontend
```bash
cd frontend
npm install          # use --force if peer dep conflicts
npm start            # dev server at localhost:3000
```

### Backend
```bash
conda create -n anote python=3.10.13
conda activate anote
cd server
pip install -r requirements.txt
export APP_ENV=local
export IS_PROD=false
flask run            # or: python -m flask run
```

### Database
```bash
mysql -u root -p
# > create database anote;
cd server/database
python init_db_dev.py
```

### SDK Only
```bash
pip install anoteai
# Generate an API key at dashboard.anote.ai and use it programmatically
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Add `.env.example`** — Document all required environment variables (DB credentials, API keys, AWS config) so new contributors can onboard without guessing
- [ ] **Move hardcoded secrets to `.env`** — Audit `server/constants/` for any hardcoded credentials and replace with environment variables
- [ ] **Expand test coverage** — Add unit tests for core Flask endpoints and Ray task orchestration; currently minimal or none
- [ ] **Add CI/CD pipeline** — GitHub Actions for linting, tests, and Docker build on every PR

### Features
- [ ] **Model comparison dashboard** — Side-by-side visualization of zero-shot vs fine-tuned model performance per dataset
- [ ] **Export fine-tuned models to HuggingFace** — Allow users to publish their fine-tuned models directly from the UI
- [ ] **Webhook/callback support** — Notify external systems when labeling jobs or fine-tuning runs complete
- [ ] **Batch annotation API** — Allow bulk annotation submissions via API (not just UI)
- [ ] **Active learning integration** — Surface the most uncertain/valuable samples for human review first
- [ ] **Multi-language support** — Extend NER and classification to non-English text

### Improvements
- [ ] **Full multi-user tenancy** — Audit any single-user hardcoded values and complete multi-tenant support
- [ ] **Pagination on all dataset/annotation endpoints** — Prevent timeout on large datasets
- [ ] **Rate limiting** — Add API rate limiting to protect the production backend
- [ ] **Improve SDK documentation** — Add end-to-end usage examples with code snippets for each task type
- [ ] **Dockerize local development** — Add `docker-compose.yml` for one-command local setup (backend + MySQL + Tika)
- [ ] **OpenAPI / Swagger spec** — Auto-generate API docs from Flask endpoints
