# AI RFPs

**Repo:** [anote-ai/AI-RFPs](https://github.com/anote-ai/AI-RFPs) · **Private**
**Status:** In Development

---

## What It Does

**AI RFPs** is an AI-assisted tool for generating, managing, and responding to **Requests for Proposals (RFPs)**. It automates the most time-consuming parts of the proposal process — parsing requirements, drafting responses, tracking deadlines, and ensuring compliance.

### Core Capabilities
- **RFP Ingestion** — parse PDF, Word, or Excel RFPs to extract requirements, evaluation criteria, and deadlines
- **AI Draft Generation** — produce section-by-section proposal drafts using past successful responses and organizational knowledge bases
- **Compliance Matrix** — auto-generate a matrix mapping each RFP requirement to a proposal section
- **Pipeline Management** — track RFPs from new → in-progress → submitted → awarded/rejected
- **Team Collaboration** — assign sections to team members, review and comment on drafts

---

## Tech Stack

> This repo is private; the following is inferred from the product description.

- **Backend:** Python (likely Flask or FastAPI)
- **Frontend:** React or similar SPA
- **LLM:** OpenAI / Anthropic API for draft generation
- **Document Parsing:** Apache Tika or python-docx for PDF/Word ingestion
- **Database:** PostgreSQL or MySQL

---

## How to Run

> This repo is private. Steps below follow inferred architecture patterns.

```bash
git clone https://github.com/anote-ai/AI-RFPs
cd AI-RFPs

# Backend
pip install -r requirements.txt
cp .env.example .env
# Set: OPENAI_API_KEY or ANTHROPIC_API_KEY, DATABASE_URL
python init_db.py
python app.py

# Frontend
npm install && npm start
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Write a README** — product overview, setup instructions, and usage guide
- [ ] **Add `.env.example`** — document all required API keys and configuration
- [ ] **Add tests** — unit tests for RFP parsing, requirement extraction, and draft generation
- [ ] **Add CI/CD** — GitHub Actions for lint and test automation

### Features
- [ ] **Multi-format RFP ingestion** — support PDF, Word (.docx), Excel, and plain text
- [ ] **Requirement extraction** — classify requirements as Mandatory (M), Desirable (D), or Compliance (C)
- [ ] **Response template library** — reusable blocks (company overview, team bios, past performance)
- [ ] **Compliance matrix auto-generation** — map every RFP requirement to a response section
- [ ] **Version history** — track all edits with author attribution and timestamps
- [ ] **Deadline tracking & calendar reminders** — Google Calendar integration with deadline alerts
- [ ] **Win/loss analysis** — track proposal outcomes and use past wins to improve future AI responses
- [ ] **Real-time collaboration** — concurrent editing of proposal sections (Google Docs-style)
- [ ] **Export to Word / PDF** — produce finished proposals in client-ready formats

### Improvements
- [ ] **Integrate with OpenAnote** — use labeled domain data from OpenAnote to fine-tune proposal generation
- [ ] **Integrate with Autonomous Intelligence** — use multi-agent workflows for complex multi-section RFPs
- [ ] **Streaming generation** — stream AI-generated text token-by-token
- [ ] **Feedback loop** — rate AI-generated sections to improve future outputs
