# AI RFPs — Product Summary

**Repo:** [anote-ai/AI-RFPs](https://github.com/anote-ai/AI-RFPs) *(Private)*
**Status:** In Development

---

## What It Does

**AI RFPs** is an AI-assisted tool for generating, managing, and responding to **Requests for Proposals (RFPs)**. It automates the most time-consuming parts of the RFP process — drafting responses, extracting requirements, tracking deadlines, and ensuring compliance with proposal guidelines.

From the product description, the platform targets organizations that regularly respond to government, enterprise, or grant RFPs by:
- **Parsing incoming RFPs** — extracting key requirements, deadlines, evaluation criteria, and compliance checkboxes
- **Auto-generating draft responses** — using AI to produce section-by-section draft text based on past successful proposals and organizational knowledge bases
- **Managing proposal pipelines** — tracking RFP status (new, in-progress, submitted, awarded/rejected) across a team
- **Collaboration tools** — assigning sections to team members, reviewing and commenting on drafts

---

## How to Run

> **Note:** This repo is private. The following is inferred from the product description and standard AI document processing architectures.

### Prerequisites
- Python 3.x and/or Node.js (depending on tech stack)
- OpenAI or Anthropic API key
- Database (PostgreSQL or MySQL)

### Setup
```bash
# Clone repo (requires org access)
git clone https://github.com/anote-ai/AI-RFPs
cd AI-RFPs

# Backend
pip install -r requirements.txt
cp .env.example .env
# Set: OPENAI_API_KEY or ANTHROPIC_API_KEY, DATABASE_URL

# Frontend
npm install
npm start

# Initialize database
python init_db.py
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Write a README** — Document the product, setup instructions, and usage guide
- [ ] **Add `.env.example`** — Document all required API keys and configuration
- [ ] **Add tests** — Unit tests for RFP parsing, requirement extraction, and response generation
- [ ] **Add CI/CD pipeline** — GitHub Actions for automated testing and linting

### Features
- [ ] **RFP document ingestion** — Support PDF, Word (.docx), and Excel RFP formats with Apache Tika or python-docx
- [ ] **Requirements extraction** — Automatically identify and list mandatory requirements (M), desirable (D), and compliance items (C) from RFP text
- [ ] **Response templates library** — Maintain a library of reusable response blocks (company overview, team bios, past performance) that AI can draw from
- [ ] **Compliance matrix generation** — Auto-generate a compliance matrix mapping each RFP requirement to a response section
- [ ] **Version history** — Track all edits to proposal sections with author attribution and timestamps
- [ ] **Deadline tracking & reminders** — Calendar integration (Google Calendar) with deadline alerts
- [ ] **Win/loss analysis** — Track outcomes of submitted proposals and use past wins to improve future AI-generated responses
- [ ] **Multi-user collaboration** — Real-time collaborative editing of proposal sections (similar to Google Docs)
- [ ] **Export to Word/PDF** — Export finalized proposals in required formats

### Improvements
- [ ] **Integration with Anote's annotation platform** — Use labeled domain-specific data from OpenAnote to fine-tune the proposal generation model
- [ ] **Integration with Autonomous Intelligence** — Use multi-agent workflows for complex multi-section RFP responses
- [ ] **Streaming generation** — Stream AI-generated text token-by-token rather than waiting for full completion
- [ ] **Feedback loop** — Allow users to rate AI-generated sections to improve future generations
