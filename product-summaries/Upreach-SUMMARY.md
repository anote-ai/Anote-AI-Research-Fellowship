# Upreach — Product Summary

**Repo:** [anote-ai/Upreach](https://github.com/anote-ai/Upreach) *(Private)*
**Status:** In Development

---

## What It Does

**Upreach** is an **AI-powered outreach and sales engagement platform** for automating and personalizing prospect communication. It is Anote's B2B sales automation tool — a competitor to Apollo.io, Outreach.io, and Instantly — combining a searchable prospect database, AI-generated personalized emails, and multi-step outreach sequences.

### Core Features

| Feature | Description |
|---|---|
| **Prospect Database** | Searchable, filterable database of contacts backed by AWS OpenSearch; contacts are "unlocked" with credits |
| **Lists Management** | Create and manage contact lists (all lists, individual lists, unlocked lists) |
| **Email Sequences** | Multi-step outreach sequences with scheduling, time-picker, and email composition |
| **Generative AI Email Writing** | AI-assisted personalized email copy generation |
| **Automation Builder** | Two-step automation creation workflow for building outreach campaigns |
| **Activity Feed / Dashboard** | Track outreach activity and engagement metrics |
| **Credit System** | Contact unlock model: credits gate access to full prospect contact details |
| **Payments / Subscriptions** | Stripe-based billing with tiered pricing |
| **Opt-Out / Compliance** | GDPR-style opt-out handling for unsubscribes |

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | React (JavaScript), Redux (UserSlice, ProfileSlice, SequenceSlice, AutomationSlice), Tailwind CSS, React Router, Axios |
| Backend | Python / Flask (`backend/app.py`) |
| Database | PostgreSQL (`backend/database/db.py`) |
| Search / Prospect Index | AWS OpenSearch (Elasticsearch-compatible) |
| Data Ingestion | AWS S3 + AWS Athena + Jupyter notebooks (`ingestion_pipeline/`) |
| Payments | Stripe (`backend/stripe_config/portal_config.py`) |
| Email Sending | SendGrid / SES / Gmail SMTP (inferred from `backend/keys/email_key`) |
| AI | OpenAI GPT for generative email copy (`frontend/src/components/GenerativeAI.js`) |
| Deployment | Docker (`backend/Dockerfile`) |

**Language split:** JavaScript (frontend-heavy), Python (backend + data pipeline)

---

## How to Run

> **Note:** This repo is private. The following is inferred from the file structure.

### Prerequisites
- Python 3.x, Node.js + npm, PostgreSQL, Docker (optional), AWS credentials (for OpenSearch + S3)

### Backend
```bash
cd backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
# Set: DATABASE_URL, OPENAI_API_KEY, STRIPE_SECRET_KEY, email credentials, AWS keys

python init_db_dev.py     # Initialize database
python app.py             # Start Flask server
```

Or via Docker:
```bash
docker build -t upreach-backend .
docker run -p 5000:5000 upreach-backend
```

### Frontend
```bash
cd frontend
npm install
cp .env.development .env.local
npm start                  # Dev server at localhost:3000
```

### Data Ingestion Pipeline
```bash
cd ingestion_pipeline/open_search_ingestion
# Configure AWS credentials and OpenSearch endpoint
jupyter notebook Ingestion.ipynb
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Write a README** — Document setup, environment variables, and architecture
- [ ] **Add `.env.example`** — List all required credentials (DB, Stripe, OpenAI, AWS, email)
- [ ] **Remove `* copy.js` component files** — Multiple components have `copy.js` variants directly in source tree (`Feed copy.js`, `GenerativeAI copy.js`, etc.); clean these up
- [ ] **Fix 14 open issues** — Triage and resolve the existing backlog
- [ ] **Add tests** — Unit tests for sequence builder, search/filter logic, and credit deduction
- [ ] **Add CI/CD pipeline** — GitHub Actions for linting and testing

### Features
- [ ] **Email deliverability monitoring** — Track open rates, click rates, reply rates, and bounces per sequence
- [ ] **A/B testing for email copy** — Test multiple subject lines or body variants within a sequence
- [ ] **AI personalization at scale** — Auto-generate unique first lines or ice-breakers per prospect using LinkedIn/company data
- [ ] **CRM integration** — Sync contacts and sequence activity with HubSpot, Salesforce, or Pipedrive
- [ ] **Email warm-up** — Gradually ramp sending volume on new email addresses to avoid spam filters
- [ ] **Reply detection & auto-pause** — Automatically pause sequences when a prospect replies
- [ ] **LinkedIn outreach** — Add LinkedIn connection requests and messages as sequence steps (not just email)
- [ ] **Analytics dashboard** — Full funnel metrics: prospects added → contacted → replied → converted

### Improvements
- [ ] **Migrate to AWS Opensearch managed service** — Replace self-managed ingestion notebooks with a proper ETL pipeline (AWS Glue or Airflow)
- [ ] **Implement proper GDPR compliance** — Audit opt-out flows, data retention policies, and consent tracking beyond the current basic opt-out handler
- [ ] **Rate limiting on email sends** — Enforce per-account daily/hourly sending limits to protect deliverability
- [ ] **Dockerize full stack** — Add `docker-compose.yml` for backend + PostgreSQL + OpenSearch for easy local development
