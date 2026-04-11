# Upreach

**Repo:** [anote-ai/Upreach](https://github.com/anote-ai/Upreach) · **Private**
**Status:** In Development | Language: JavaScript + Python | Size: ~47 MB | Last updated: April 2026

---

## What It Does

**Upreach** is an AI-powered outreach and sales engagement platform — Anote's answer to Apollo.io, Outreach.io, and Instantly. It combines a searchable prospect database, AI-generated personalized emails, and multi-step outreach sequences.

### Core Features

| Feature | Description |
|---|---|
| **Prospect Database** | Searchable, filterable contact database backed by AWS OpenSearch; contacts unlocked with credits |
| **Lists Management** | Create and manage contact lists (all, individual, unlocked) |
| **Email Sequences** | Multi-step outreach with scheduling, time-picker, and email composition |
| **Generative AI Email Copy** | AI-generated personalized email drafts |
| **Automation Builder** | Two-step workflow creator for outreach campaigns |
| **Activity Feed / Dashboard** | Track outreach activity and engagement metrics |
| **Credit System** | Credits gate access to full prospect contact details |
| **Payments / Subscriptions** | Stripe billing with tiered pricing |
| **Opt-Out / Compliance** | GDPR-style opt-out handling for unsubscribes |

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | React (JavaScript), Redux, Tailwind CSS, React Router, Axios |
| Backend | Python / Flask |
| Database | PostgreSQL |
| Search / Prospect Index | AWS OpenSearch (Elasticsearch-compatible) |
| Data Ingestion | AWS S3 + AWS Athena + Jupyter notebooks |
| Payments | Stripe |
| Email Sending | SendGrid / SES / Gmail SMTP (inferred) |
| AI | OpenAI GPT for generative email copy |
| Deployment | Docker (`backend/Dockerfile`) |

---

## How to Run

> This repo is private. Steps below are inferred from the file structure.

### Prerequisites
Python 3.x, Node.js + npm, PostgreSQL, AWS credentials (for OpenSearch + S3)

### Backend
```bash
cd backend
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
# Set: DATABASE_URL, OPENAI_API_KEY, STRIPE_SECRET_KEY, email credentials, AWS keys
python init_db_dev.py
python app.py
```

Or via Docker:
```bash
docker build -t upreach-backend . && docker run -p 5000:5000 upreach-backend
```

### Frontend
```bash
cd frontend
npm install
cp .env.development .env.local
npm start    # localhost:3000
```

### Data Ingestion
```bash
cd ingestion_pipeline/open_search_ingestion
# Configure AWS credentials and OpenSearch endpoint
jupyter notebook Ingestion.ipynb
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Write a README** — setup, architecture overview, and env var documentation
- [ ] **Add `.env.example`** — list all required credentials (DB, Stripe, OpenAI, AWS, email)
- [ ] **Remove `* copy.js` component files** — clean up `Feed copy.js`, `GenerativeAI copy.js`, etc. from the source tree
- [ ] **Triage 14 open issues** — work through existing backlog
- [ ] **Add tests** — unit tests for sequence builder, search/filter, and credit deduction
- [ ] **Add CI/CD** — GitHub Actions for lint and test

### Features
- [ ] **Email deliverability monitoring** — track open, click, reply, and bounce rates per sequence
- [ ] **A/B testing** — test multiple subject lines or email variants within a sequence
- [ ] **AI personalization at scale** — auto-generate unique first lines per prospect using company/LinkedIn data
- [ ] **CRM integrations** — sync contacts and activity with HubSpot, Salesforce, or Pipedrive
- [ ] **Email warm-up** — gradually ramp sending volume on new addresses to avoid spam filters
- [ ] **Reply detection & auto-pause** — pause sequences automatically when a prospect replies
- [ ] **LinkedIn outreach steps** — add LinkedIn messages and connection requests as sequence steps
- [ ] **Full analytics funnel** — prospects added → contacted → replied → converted

### Improvements
- [ ] **Proper ETL pipeline** — replace ad-hoc ingestion notebooks with AWS Glue or Airflow
- [ ] **GDPR compliance audit** — review data retention policies, consent tracking, and opt-out flows
- [ ] **Sending rate limits** — enforce daily/hourly limits per account to protect deliverability
- [ ] **Dockerize full stack** — `docker-compose.yml` for backend + PostgreSQL + OpenSearch
