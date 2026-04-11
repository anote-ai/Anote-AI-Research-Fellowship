# OpenAnote — MLOps Platform

**Repo:** [anote-ai/OpenAnote](https://github.com/anote-ai/OpenAnote) · Public · Apache 2.0
**Live:** [dashboard.anote.ai](https://dashboard.anote.ai/) | **Status:** Production

---

## What It Does

OpenAnote is an end-to-end MLOps platform for obtaining labeled data and comparing zero-shot LLMs against fine-tuned models. It supports four core task types:

- **Text Classification** — categorize documents with LLMs or fine-tuned models
- **Named Entity Recognition (NER)** — tag entities across text
- **Chatbot / RAG** — cross-document Q&A via Retrieval-Augmented Generation
- **Prompting** — per-document or line-level Q&A

The platform follows a 10-step human-in-the-loop workflow: Project Creation → Dataset Definition → Evaluation Metrics → Zero-Shot Predictions → Fine-Tuning → Labeling Strategies → Model Integration → Workflow Iteration → Final Reporting → API Access.

OpenAnote is the open-source reference version of the full product at [dashboard.anote.ai](https://dashboard.anote.ai/).

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | React, Redux, Zustand, Google OAuth |
| Backend | Python, Flask (60+ REST endpoints) |
| Database | MySQL |
| LLMs | OpenAI (GPT-4, GPT-4 Mini), Anthropic (Claude), Meta (Llama3), Mistral, Google (Gemini), xAI (Grok), Groq |
| Fine-Tuning | Supervised fine-tuning with LoRA / QLoRA; RLHF / RLAIF |
| Distributed ML | Ray (GPU/CPU distributed training and prediction) |
| Infrastructure | AWS (S3, ECR, Elastic Beanstalk, CloudFront), Docker, Kubernetes/EKS |
| Document Parsing | Apache Tika |
| SDK | Python package `anoteai` (pip installable) |
| Docs | MkDocs |

---

## How to Run

### Prerequisites
Node.js, Python 3.10.13 (conda), MySQL, JDK 8+ (for Tika)

### Frontend
```bash
cd frontend
npm install        # use --force if peer dep conflicts
npm start          # localhost:3000
```

### Backend
```bash
conda create -n anote python=3.10.13
conda activate anote
cd server
pip install -r requirements.txt
export APP_ENV=local IS_PROD=false
flask run
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
# Generate API key at dashboard.anote.ai
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Add `.env.example`** — document all required env vars (DB credentials, API keys, AWS config)
- [ ] **Move hardcoded secrets to `.env`** — audit `server/constants/` for any hardcoded credentials
- [ ] **Add test coverage** — unit tests for Flask endpoints and Ray task orchestration
- [ ] **Add CI/CD** — GitHub Actions for lint, tests, and Docker build on every PR

### Features
- [ ] **Model comparison dashboard** — side-by-side visualization of zero-shot vs fine-tuned performance
- [ ] **Export fine-tuned models to HuggingFace** — publish fine-tuned models directly from the UI
- [ ] **Webhook/callback support** — notify external systems when labeling or training jobs complete
- [ ] **Batch annotation API** — bulk annotation submissions via API (not just UI)
- [ ] **Active learning** — surface the most uncertain samples for human review first
- [ ] **Multi-language support** — extend NER and classification to non-English text

### Improvements
- [ ] **Full multi-tenant support** — remove any hardcoded single-user values
- [ ] **Pagination on all endpoints** — prevent timeouts on large datasets
- [ ] **Rate limiting** — protect the production backend from abuse
- [ ] **Dockerize local dev** — `docker-compose.yml` for one-command setup (backend + MySQL + Tika)
- [ ] **OpenAPI / Swagger spec** — auto-generate API docs from Flask endpoints
- [ ] **Improve SDK docs** — end-to-end code examples for each task type
