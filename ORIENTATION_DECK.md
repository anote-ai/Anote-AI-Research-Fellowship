# Anote AI Research Fellowship
## Summer 2026 — Orientation Deck

> **June 1, 2026 | 6:00 PM – 8:00 PM EST**
> WeWork, New York City + Zoom
> Program Lead: Natan | Program Manager: Rajshri

---

---

# SLIDE 1
# Welcome to the Fellowship

You were selected because we believe you can do something rare:
**produce publishable AI research and ship real product — in the same summer.**

This is not a lecture series. This is not a class.
This is a research lab with a product team attached to it.

**10 weeks. 3 deliverables. Real impact.**

---

---

# SLIDE 2
# About Anote

**Mission:** Make AI accessible, reliable, and trustworthy for the enterprise.

Anote builds the tools enterprises need to move from raw data to deployed AI — covering the full lifecycle: labeling, fine-tuning, retrieval, agents, and evaluation.

**Where we operate:**
- Enterprise AI teams who need accurate, auditable AI
- Organizations moving from pilots to production
- Teams who need data labeling, private chatbots, agent workflows, and reliable retrieval

**Why research matters here:**
Every paper we publish is a proof point that our products work — and that our team knows how.
Our research *is* our GTM differentiation.

---

---

# SLIDE 3
# What You'll Build This Summer

Every fellow ships **three deliverables** by August 10:

---

### Deliverable 1 — AI Research Paper
- Select a topic from 23 active research tracks (or propose your own)
- Publish to **arXiv** and submit to a top AI conference (AAAI 2027, SIGIR 2027, ICLR 2027)
- Use the Anote LaTeX template; work in Overleaf
- Milestones every two weeks; peer review before submission

---

### Deliverable 2 — Final Presentation
- **August 5, 5–10 PM EST** — recorded and published to YouTube
- 20-minute slot: research findings + product contribution + key learnings
- Use the [Anote Google Slides Template](https://docs.google.com/presentation/d/1x4E2dwBnDImHjMOMaI8lLWcRNjVWlnsYEJ3WOwlhKuA)
- Inspired by past Anote showcases: [Pale Blue Dot](https://anote.ai/palebluedot), [Panacea](https://anote.ai/panacea)

---

### Deliverable 3 — Product Ownership
- Take ownership of one Anote product from Day 1
- Ship features, fix bugs, improve docs — using **Claude Code** or Codex
- All PRs merged and documented by August 10
- Bring blockers to Thursday Product Standups; demos welcome

---

---

# SLIDE 4
# The Summer at a Glance

```
Jun  1  ──── Orientation & Kickoff
Jun  3  ──── Research Standup #1 (introductions, initial goals)
Jun  5  ──── Product Standup #1 (repo access, Claude Code onboarding)
Jun  9  ──── Research topic confirmed by each fellow
Jun 23  ──── Abstract / outline draft due
Jul  1  ──── Midpoint one-on-ones with Natan (20 min each)
Jul 14  ──── Methodology / experiments section done
Jul 21  ──── Full paper draft shared for team review
Jul 28  ──── Revisions incorporated; submission target set
Aug  4  ──── Final paper polish; arXiv + conference submission confirmed
Aug  5  ──── FINAL PRESENTATIONS (5–10 PM, recorded)
Aug  7  ──── Anote Summer Party 🎉 NYC
Aug 10  ──── Last day: code clean-up, docs, paper submissions
```

**Recurring Events:**
| Day | Time | Event |
|-----|------|-------|
| Every Tuesday | 5:00–5:30 PM EST | AI Research Standup (Virtual) |
| Every Thursday | 5:00–5:30 PM EST | AI Product Standup (Virtual) |
| Every Friday | 1:00–2:00 PM EST | Fellowship Talk — Guest Expert (WeWork NYC) |

---

---

# SLIDE 5
# The Team

| Role | Person | Responsibility |
|------|--------|----------------|
| **Program Lead** | Natan | Vision, mentorship, final decisions, midpoint & final reviews |
| **Program Manager** | Rajshri | Operations, logistics, standups, speaker booking, fellow support |
| **Steering Committee** | TBD (2–3 members) | Paper quality oversight, academic feedback, conference guidance |
| **Fellows** | You (up to 15) | Research, product, and presentations |

**How to reach us:**
- Day-to-day → Slack `#fellowship` channel
- Blockers → Bring to Tuesday (research) or Thursday (product) standup
- Urgent → DM Rajshri directly

---

---

# SLIDE 6
# Our Products — Overview

Fellows own one product for the summer. Each product has real users or is headed toward launch.

| # | Product | Status | What It Does |
|---|---------|--------|-------------|
| 1 | **MLOps Platform (OpenAnote)** | Production | Data labeling, fine-tuning, SDK, chatbot |
| 2 | **Panacea** (Autonomous Intelligence) | Production | Multi-agent orchestration |
| 3 | **Armor** (Community) | Production | AI knowledge-sharing community hub |
| 4 | **Model Leaderboard** | POC | LLM rankings and expert evaluations |
| 5 | **Synthetic Data** | POC | Multi-modal synthetic dataset generation |
| 6 | **Private Chatbot (PrivateGPT Desktop)** | POC | On-premise, zero-data-sharing AI chat |
| 7 | **Slackbot** | In Dev | Anote AI workflows inside Slack |
| 8 | **AI RFPs** | In Dev | Auto-generate and manage RFP responses |
| 9 | **Upreach** | In Dev | AI-powered sales outreach and engagement |
| 10 | **AI Assisted Coding Tool** | Production | Claude-powered coding CLI + VS Code extension |

> All repos at [github.com/anote-ai](https://github.com/orgs/anote-ai/repositories)

---

---

# SLIDE 7
# Product Deep Dive: MLOps Platform (OpenAnote)

**Repo:** `anote-ai/OpenAnote` | **Live:** [dashboard.anote.ai](https://dashboard.anote.ai)
**Stack:** Python + React | **Setup:** `docker-compose up`

**What it does:**
The core Anote platform. End-to-end MLOps for the enterprise — data labeling, model fine-tuning, an SDK for custom workflows, and a chatbot interface. This is the product most enterprise customers interact with first.

**Why it matters:**
OpenAnote is Anote's flagship commercial product. Improvements here have direct revenue impact. Strong labeling pipelines reduce the cost and time to get enterprise AI into production.

**Sample experiments for fellows:**
- Streaming labelbot responses (`<100ms per token`)
- Fine-tuning pipeline observability (dashboards, zero lost jobs)
- SDK documentation revamp (quickstart, code examples)

**GTM connection:** Directly sold to enterprise data and ML teams. The more reliable and observable the labeling pipeline, the faster deals close.

---

---

# SLIDE 8
# Product Deep Dive: Panacea (Autonomous Intelligence)

**Repo:** `anote-ai/Autonomous-Intelligence` | **Live:** [chat.anote.ai](https://chat.anote.ai)
**Stack:** Python + React | **Setup:** `docker-compose up`

**What it does:**
Anote's multi-agent orchestration framework. Panacea coordinates multiple AI agents to complete complex, multi-step enterprise tasks — with visibility into what each agent did and why.

**Why it matters:**
Agentic AI is the next frontier for enterprise automation. Panacea positions Anote at the center of that wave — not just as a labeling tool, but as an autonomous execution layer.

**Sample experiments for fellows:**
- Agent failure recovery (`<5% unrecovered failures`)
- Multi-agent coordination patterns (round-robin task allocation)
- Agent audit trail (compliance logging for every tool call)

**GTM connection:** Targets enterprise automation buyers (ops, IT, finance). Audit trails and failure recovery are the key trust signals that unlock procurement.

---

---

# SLIDE 9
# Product Deep Dive: Armor (Community)

**Repo:** `anote-ai/Community` | **Live:** [community.anote.ai](https://community.anote.ai)
**Stack:** React | **Setup:** `npm`

**What it does:**
Anote's community and events hub — a place for AI practitioners to connect, share knowledge, attend talks, and access Anote resources. Think of it as the front porch of the Anote brand.

**Why it matters:**
Community is how Anote grows organically. Every fellowship talk that gets recorded and posted here extends Anote's reach. Strong community = pipeline for future customers and fellows.

**Sample experiments for fellows:**
- Semantic search over community posts (`<200ms`, relevance +30%)
- Event registration automation (auto calendar invites, 90% RSVP rate)
- User onboarding flow redesign (>70% completion rate)

**GTM connection:** Community drives top-of-funnel brand awareness and inbound leads. Event engagement signals help identify high-intent prospects.

---

---

# SLIDE 10
# Product Deep Dive: Model Leaderboard

**Repo:** `anote-ai/Leaderboard` | **Live:** [anote.ai/leaderboard](https://anote.ai/leaderboard)
**Stack:** Python + React | **Setup:** `docker-compose up`

**What it does:**
An LLM performance leaderboard combining automated benchmarks with expert human evaluations. Goes beyond Hugging Face benchmarks by incorporating enterprise-relevant tasks and human-in-the-loop scoring.

**Why it matters:**
Enterprises don't trust generic benchmarks. A credible, independently maintained leaderboard that incorporates real-task performance becomes a key decision tool — and keeps Anote central to the model selection conversation.

**Sample experiments for fellows:**
- Continuous evaluation pipeline (zero manual eval runs)
- Leaderboard API (REST/GraphQL for third-party integrations)
- Model comparison tool (side-by-side analysis, +50% user engagement)

**GTM connection:** Drives traffic from buyers evaluating models. Positions Anote as a neutral, trusted evaluator — which opens conversations about custom evaluation and annotation services.

---

---

# SLIDE 11
# Product Deep Dive: Synthetic Data

**Repo:** `anote-ai/Synthetic-Data` | **Live:** [anote.ai/syntheticdata](https://anote.ai/syntheticdata)
**Stack:** Python + React | **Setup:** `docker-compose up`

**What it does:**
Generate synthetic training datasets across modalities — text, image, audio, and beyond. Helps enterprises build training data without expensive human labeling from scratch or privacy-sensitive real data.

**Why it matters:**
Data scarcity is one of the biggest blockers to enterprise AI adoption. Synthetic data unlocks fine-tuning for domains where labeled data is sparse, sensitive, or expensive to collect.

**Sample experiments for fellows:**
- Multimodal generation (video + 3D mesh support)
- Data quality metrics dashboard (bias detection, distribution shift scoring)
- Domain-specific templates (finance, healthcare, legal)

**GTM connection:** Pairs directly with OpenAnote — customers label some real data, then generate synthetic augmentations at scale. Reduces time-to-model by 60–80%.

---

---

# SLIDE 12
# Product Deep Dive: Private Chatbot (PrivateGPT Desktop)

**Repo:** `anote-ai/PrivateGPT-Desktop` | **Live:** [anote.ai/downloadprivategpt](https://anote.ai/downloadprivategpt)
**Stack:** Electron + Python | **Setup:** `npm + pip`

**What it does:**
A desktop application that runs AI chat entirely on-device or on-premise. Zero data leaves the building. Uses zero-shot local models (Llama, Mistral) for regulated industries where cloud AI is off the table.

**Why it matters:**
Healthcare, legal, government, and finance all have data residency requirements that block cloud AI. PrivateGPT is Anote's answer — enterprise AI without compliance risk.

**Sample experiments for fellows:**
- Local model switching between LLMs (`<2s` model swap)
- Chunking strategy optimization for legal/medical PDFs (+25% retrieval accuracy)
- Memory footprint reduction (app launches in `<3s` on MacBook)

**GTM connection:** Opens doors in regulated verticals where no cloud AI vendor can compete. High-value, long-tail enterprise contracts. Pairs with RAG research tracks (T4, T5, T11).

---

---

# SLIDE 13
# Product Deep Dive: Slackbot

**Repo:** `anote-ai/Slackbot` | **Status:** In Development
**Stack:** Python | **Setup:** `pip / docker`

**What it does:**
Brings Anote's AI workflows directly into Slack. Fellows can annotate, label, query knowledge bases, and run Anote automations with slash commands — without leaving their main work tool.

**Why it matters:**
Adoption of AI tools increases dramatically when they meet users where they already work. A well-built Slackbot reduces friction and shortens the path from "interesting demo" to "daily habit."

**Sample experiments for fellows:**
- Slash command registry (`/label`, `/annotate`, `/feedback` — 80% adoption)
- Message threading (zero off-topic replies)
- Analytics dashboard (10+ usage and satisfaction metrics)

**GTM connection:** Acts as an embedded distribution channel. Once the bot is in a customer's Slack, upsell and expansion become much easier conversations.

---

---

# SLIDE 14
# Product Deep Dive: AI RFPs

**Repo:** `anote-ai/AI-RFPs` | **Status:** In Development
**Stack:** Python | **Setup:** `pip`

**What it does:**
AI-assisted tool for generating, managing, and responding to Requests for Proposals. Helps enterprise sales teams draft high-quality RFP responses in a fraction of the time — with compliance checking built in.

**Why it matters:**
Enterprise AI sales are often gated by lengthy RFP processes. Automating RFP response means Anote (and its customers) can compete for more contracts with less effort.

**Sample experiments for fellows:**
- RFP auto-generation from requirements docs (50% faster RFP creation)
- Semantic search over past RFP wins (20% faster completion via reuse)
- Compliance checker (SOC 2, GDPR — zero non-compliant RFPs)

**GTM connection:** This is a self-eating product — Anote uses it internally to win deals faster, and sells it to enterprise procurement and sales teams facing the same problem.

---

---

# SLIDE 15
# Product Deep Dive: Upreach

**Repo:** `anote-ai/Upreach` | **Status:** In Development
**Stack:** Python + React | **Setup:** `docker-compose up`

**What it does:**
AI-powered outbound sales engagement. Automates and personalizes prospect communication — from first touch to follow-up — using prospect profile data and conversation history.

**Why it matters:**
Personalized outreach converts significantly better than spray-and-pray sequences. Upreach lets small sales teams punch well above their weight class.

**Sample experiments for fellows:**
- Personalized email sequences (+25% open rate vs. templates)
- Objection handling bot (detect and suggest responses to prospect objections)
- Campaign ROI attribution (link outreach to closed deals; 100% deal attribution)

**GTM connection:** Directly powers Anote's own outbound motion. A fellow improving Upreach is improving Anote's pipeline — and validating the product for the market simultaneously.

---

---

# SLIDE 16
# Product Deep Dive: AI Assisted Coding Tool

**Repo:** `anote-ai/AI-Assisted-Coding-Tool` | **Status:** Production
**Stack:** Node + Python + Rust | **Setup:** `npm + pip`

**What it does:**
A production-grade AI coding assistant built on the **Claude Agent SDK** — with a CLI, Web UI, and VS Code extension. Full codebase access, file editing, and streaming responses. Think: Anote's own Claude Code.

**Why it matters:**
Developers are the fastest-growing AI buyer segment. An opinionated coding tool built on Claude positions Anote in the developer tooling space and serves as a proof-of-concept for Claude SDK expertise.

**Sample experiments for fellows:**
- Multi-language support (Python, Go, Rust, Java — 4+ languages documented)
- Streaming code edits (`<500ms` time-to-first-edit)
- Workspace dependency resolver (auto-parse `package.json` / `requirements.txt`)

**GTM connection:** Developer tools drive bottom-up adoption — individuals adopt, then evangelize to their teams. Pairs with research on agentic evaluation (T1a) and code generation benchmarks.

---

---

# SLIDE 17
# Our Research — The Big Picture

Anote's research program exists at the intersection of **academic credibility** and **commercial relevance**.

**Why we publish:**
- Published papers = proof our products work
- arXiv preprints = SEO, inbound, and sales conversation starters
- Conference acceptances = recruiting signal and brand equity
- Research findings feed directly back into product roadmaps

**The 23 Research Tracks cover four domains:**

| Domain | Tracks | GTM Angle |
|--------|--------|-----------|
| **Agent Evaluation & Orchestration** | T1a, T1b, T12, T16 | Validates Panacea + Coding Tool |
| **Data Annotation & Synthetic Data** | T2a, T2b, T3, T13, T14, T22 | Validates OpenAnote + Synthetic Data |
| **Retrieval (RAG) & Knowledge** | T4, T5, T7, T8, T11, T15, T18, T19, T21, T23 | Validates Private Chatbot + Panacea RAG |
| **Evaluation & Benchmarking** | T6, T9, T10, T17, T20 | Validates Leaderboard + cross-product |

> **Primary target conferences:** AAAI 2027, SIGIR 2027, ICLR 2027, WSDM 2027

---

---

# SLIDE 18
# Research → GTM: The Connection

Our research directly supports how we sell. Here's the map:

---

### AnnotateBench (T2a) + AnnotateROI (T2b) → MLOps Platform
**Research question:** How much labeled data do you actually need? What's the ROI of annotation?
**GTM impact:** When a prospect asks "why should we pay for data labeling?" — we have a peer-reviewed answer. These papers are the scientific case for OpenAnote.

---

### AgenticEval (T1a) → Panacea
**Research question:** Do standard benchmarks (BFCL) predict real-world enterprise trustworthiness for agentic systems?
**GTM impact:** Gives Panacea a defensible claim: "We don't just benchmark well — we benchmark on what *enterprise agents actually need* to do." Makes compliance and procurement conversations easier.

---

### EnterpriseSynth (T1b) → Synthetic Data Product
**Research question:** Can we generate agentic SFT training data from API schemas without live execution?
**GTM impact:** This is the scientific foundation for the Synthetic Data product. A published paper validating the approach lets us sell synthetic data generation to enterprise ML teams with academic credibility.

---

### RAG Failure Propagation (T4) + RetrievalBench (T5) → Private Chatbot + Panacea
**Research question:** How do retrieval errors cascade through agent pipelines? Which retrieval strategies generalize across domains?
**GTM impact:** Regulated-industry buyers (healthcare, legal, finance) demand proof of reliability. T4 and T5 papers answer "what happens when retrieval goes wrong?" and "how do you choose the right retrieval strategy?" — directly addressing top objections in Private Chatbot sales cycles.

---

### Human-AI Teaming (T3) → OpenAnote + Annotation Services
**Research question:** How does the human-AI collaboration protocol affect downstream model performance?
**GTM impact:** Differentiates Anote's human-in-the-loop annotation from fully automated pipelines. The research answers "why human annotation still matters" in the age of LLMs — and why customers should pay for it.

---

### Backlog Tracks (T6–T23) → Cross-Product
Each backlog track is paired to at least one product. Fellows choosing backlog tracks should ask: *"What does this research prove about our product, and how would a customer use this finding?"*

---

---

# SLIDE 19
# Active Research Tracks — Summer 2026

**Priority tracks** targeting AAAI 2027 and SIGIR 2027 abstract deadlines (~August 2026):

| Track | Title | Core Question | Target Venue |
|-------|-------|--------------|-------------|
| **T1a** | AgenticEval | Does BFCL predict enterprise trustworthiness for agents? | AAAI 2027, ICLR 2027 |
| **T1b** | EnterpriseSynth | Generate agentic SFT data from API schemas without live execution? | AAAI 2027, ICLR 2027 |
| **T2a** | AnnotateBench | How much labeled data do annotation strategies need? | AAAI 2027, ACL ARR |
| **T2b** | AnnotateROI | How should enterprises measure annotation ROI? | AAAI 2027, WSDM 2027 |
| **T3** | Human-AI Teaming | How does collaboration protocol affect model performance? | AAAI 2027, CSCW 2027 |
| **T4** | RAG Failure Propagation | How do retrieval errors propagate through agentic RAG? | AAAI 2027, SIGIR 2027 |
| **T5** | RetrievalBench | Which retrieval strategies generalize across domains? | SIGIR 2027, WSDM 2027 |

> **Confirm your track with Natan by June 9.** You may also propose your own — bring it to Tuesday standup.

**Template:** [Anote LaTeX Template on GitHub](https://github.com/anote-ai/Research/blob/main/researchpapers/main.tex)
**Tracker:** `anote_fellowship_tracker.xlsx` in the Research repo

---

---

# SLIDE 20
# Backlog Research Tracks — Available for Selection

| Track | Title | Domain |
|-------|-------|--------|
| T6 | FineTuneBench | Fine-tuning vs. RAG in domain-specific QA |
| T7 | MultiHopRAG | Agent-based decomposition for multi-hop queries |
| T8 | TableRAG | RAG for tabular and financial datasets |
| T9 | EmbedBench | Cross-domain embedding model performance |
| T10 | LLMClassifyBench | LLM vs. fine-tuned classifiers under domain shift |
| T11 | PrivacyRAG | Sensitive entity protection in retrieval |
| T12 | AgentMemory | Long-horizon memory architectures for agents |
| T13 | SLMFineTune | PEFT methods for enterprise domain adaptation |
| T14 | NERBench | Annotation requirements for specialized NER |
| T15 | ChunkingTheory | Automatic chunking strategy selection for RAG |
| T16 | AgenticOrchestration | Multi-agent coordination for enterprise tasks |
| T17 | SyntheticEval | Reliability of synthetic evaluation datasets |
| T18 | HallucinationRAG | Hallucination mitigation in RAG systems |
| T19 | MultiDocRAG | Cross-document answer synthesis in retrieval |
| T20 | PromptStability | LLM sensitivity to prompt variation |
| T21 | ActiveRAG | Active learning for knowledge base curation in RAG |
| T22 | LLMDataAug | Effectiveness of LLM-based data augmentation |
| T23 | OntologyRAG | Domain ontologies for medical and legal retrieval |

> Interested in a backlog track? Discuss with Natan — you'll pick the venue together once scope is defined.

---

---

# SLIDE 21
# The Friday Fellowship Talk Series

**9 talks. Every Friday. 1:00–2:00 PM EST. WeWork NYC + Zoom.**

The Friday talk series brings in AI researchers, engineers, and practitioners from academia and industry to share their work directly with fellows.

**Format:**
- 30–40 minute talk by the guest
- 15–20 minute Q&A with fellows
- Recorded and published to [Anote YouTube](https://youtube.com) within 48 hours
- Monday spotlight post on LinkedIn and Twitter before each talk

---

**Talk Schedule:**

| # | Date | Status |
|---|------|--------|
| Talk 1 | Friday, June 6 | Speaker TBD |
| Talk 2 | Friday, June 13 | Speaker TBD |
| Talk 3 | Friday, June 20 | Speaker TBD |
| Talk 4 | Friday, June 27 | Speaker TBD |
| Talk 5 | Friday, July 3 | Speaker TBD *(Holiday weekend — confirm attendance)* |
| Talk 6 | Friday, July 10 | Speaker TBD |
| Talk 7 | Friday, July 17 | Speaker TBD |
| Talk 8 | Friday, July 24 | Speaker TBD |
| Talk 9 | Friday, July 31 | Speaker TBD |

---

**Target speaker profiles:**
- AI researchers (PhD through faculty) from Cornell Tech, NYU, Columbia, MIT, CMU, Stanford
- Industry practitioners from Google, Meta, Microsoft, or startups
- Topics: NLP, ML systems, computer vision, AI safety, applied AI, AI products

**Fellows:** Come with questions. Talks are not lectures — they're conversations. Engaging with speakers builds relationships that last beyond the summer.

---

---

# SLIDE 22
# The Friday Talk Experience — What to Expect

**As a fellow, every Friday:**

1. Show up in person at WeWork NYC (Zoom available for remote fellows)
2. Speaker talks for ~35 minutes — take notes on research methods and angles you can apply to your own paper
3. Q&A is your time — ask something specific, not generic
4. Recordings are shared in Slack `#fellowship` by Monday
5. Social media spotlight goes out Monday morning — we tag speakers on LinkedIn/Twitter

**What makes a great Q&A question:**
- Tie it to your research track ("In your work on X, how did you handle Y — we're seeing a similar challenge in our RAG research")
- Ask about failure modes, not just successes
- Ask about what they'd do differently

**After the talk:**
- Key references shared in Slack
- If the speaker's work connects to your paper track, reach out directly — many will advise informally
- Recordings go to the community site at [community.anote.ai](https://community.anote.ai)

---

---

# SLIDE 23
# Tools & Access

Everything is provisioned at or before orientation. If something is missing, ping Rajshri.

| Tool | What It's For | Access |
|------|--------------|--------|
| **GitHub** (`anote-ai` org) | All product repos + Research repo | Provisioned before Jun 1 |
| **Claude Code** | AI-powered coding for product contributions | Provisioned at orientation |
| **Codex** | Alternative AI coding tool | Provisioned at orientation |
| **Slack** | Primary communication channel | Add yourself to `#fellowship` |
| **Zoom** | Virtual standups and Friday talks | Links in calendar invites |
| **Overleaf** | LaTeX paper writing (research) | Create your own; LaTeX template in Research repo |
| **arXiv** | Paper preprint submission | Create account by end of June |
| **Google Slides Template** | Final presentation slides | [Link](https://docs.google.com/presentation/d/1x4E2dwBnDImHjMOMaI8lLWcRNjVWlnsYEJ3WOwlhKuA) |
| **EC2 Shared Instance** | Shared dev environment (all repos pre-cloned) | `ssh anote@[EC2_IP]` — credentials in Slack |

**Shared EC2:**
- All repos at `/home/anote/repos/`
- Run `docker compose up` in any product directory after copying `.env.example → .env`
- Pull latest across all repos: `/home/anote/update-repos.sh`

---

---

# SLIDE 24
# Research Paper Milestones

Every fellow follows this milestone schedule:

| Deadline | Deliverable | Where |
|----------|------------|-------|
| **June 9** | Research topic confirmed with Natan | Slack DM + Tuesday Standup |
| **June 23** | Abstract and outline drafted | Share in Tuesday Standup |
| **July 14** | Methodology + experiments section complete | Share draft in standup |
| **July 21** | Full paper draft shared with team for review | Email to Rajshri + Natan |
| **July 28** | Revisions incorporated; peer feedback done | Ready for final polish |
| **August 4** | Final paper polish; submission confirmed | arXiv draft live |
| **August 10** | Paper submitted to arXiv + at least one conference | Link in Slack |

**Target conferences (abstract deadlines ~August 2026):**
- AAAI 2027 → aaai.org (primary)
- SIGIR 2027 → sigir.org (retrieval/RAG papers)
- ICLR 2027 → iclr.cc (deadlines open right after fellowship)
- WSDM 2027 → wsdm-conference.org (retrieval, applied AI)
- ACL Rolling Review → aclrollingreview.org (monthly cycles; NLP-heavy papers)

> **Minimum bar:** An arXiv preprint live by August 10, even if the full conference submission follows. A preprint establishes priority and demonstrates real output.

---

---

# SLIDE 25
# Product Contribution Milestones

**Week 1 (by June 9):**
- Confirm repo access + set up local or EC2 dev environment
- Explore the codebase, read existing docs and open issues
- Write a short improvement plan: 2–3 concrete experiments with success criteria

**Ongoing (every sprint):**
- Ship improvements, document PRs clearly
- Bring blockers to Thursday Product Standup
- Demo working features whenever possible

**By August 10:**
- All PRs merged to main
- README and documentation updated
- Handoff notes written for the next maintainer
- Product contributions highlighted in Final Presentation (August 5)

**Experiment scoping template:**
For each contribution, define:
1. Problem statement (what pain point does this solve?)
2. Success criteria (how will you measure it?)
3. Scope (Epic / Feature / Bug)
4. Acceptance checklist (code merged, tests pass, docs updated, handoff notes)

---

---

# SLIDE 26
# How to Succeed Here

**On research:**
- Pick a track that genuinely interests you — you'll be living with it for 10 weeks
- Start narrow; expand scope only after you have preliminary results
- Read 5–10 recent papers in your area before writing a single word
- Use Tuesday standups to surface blockers early, not late

**On product:**
- Spend Week 1 reading code and issues — don't write a line of feature code before you understand the codebase
- Small, clean PRs > one giant change
- Write the README update as part of every PR, not after
- The Thursday standup is your sync with the team — show up with demos, not slides

**On the Friday talks:**
- Show up. Every week. In person if at all possible.
- Prepare one question before every talk. Write it down.
- Build relationships with speakers — they're future advisors, collaborators, or referrals

**On the fellowship overall:**
- This is a rare window to do focused research with a team behind you. Treat it like one.
- If you're stuck, say so. We'd rather unblock you in Week 2 than find out in Week 8.
- Your Final Presentation is a public record of your summer. Make it something you're proud to share.

---

---

# SLIDE 27
# The Three Questions That Drive Everything

Before you make any decision about your research or product work, ask:

---

**1. Does this research make an Anote product more credible to a customer?**

If a prospect asked "why should I trust your product for this use case?" — could you hand them this paper as part of the answer? If yes, you're on the right track.

---

**2. Does this product improvement make a real user's life noticeably better?**

Not "is this technically interesting?" — but "would a user notice and care?" If the answer is yes, ship it. If not, scope it down or reprioritize.

---

**3. Can I explain what I built and why it matters in 20 minutes?**

Your Final Presentation is August 5. Start thinking about what story you're telling from Day 1. The best presentations connect research + product into a single coherent narrative.

---

---

# SLIDE 28
# Your First Week — Checklist

**By end of Day 1 (June 1):**
- [ ] Attend Orientation (6–8 PM)
- [ ] Join Slack `#fellowship` channel
- [ ] Confirm GitHub access to your assigned product repo
- [ ] Confirm Claude Code / Codex access

**By June 3 (Research Standup #1):**
- [ ] Review the 23 research tracks in `RESEARCH_FELLOW_MATCHING.md`
- [ ] Come with top 2–3 track preferences (or a track proposal)
- [ ] Introduce yourself: name, background, research interest, one question you want to answer this summer

**By June 5 (Product Standup #1):**
- [ ] Set up local or EC2 dev environment for your product
- [ ] Read the product README and open issues
- [ ] Identify one quick win you can ship in Week 2

**By June 9 (Research Standup #2):**
- [ ] Research track confirmed with Natan
- [ ] 5 key papers read in your area
- [ ] Improvement plan for your product: 2–3 experiments with success criteria

---

---

# SLIDE 29
# Key Links

| Resource | Link |
|----------|------|
| All Product Repos | [github.com/anote-ai](https://github.com/orgs/anote-ai/repositories) |
| Research Repo | [github.com/anote-ai/Research](https://github.com/anote-ai/Research) |
| Anote Slides Template | [Google Slides](https://docs.google.com/presentation/d/1x4E2dwBnDImHjMOMaI8lLWcRNjVWlnsYEJ3WOwlhKuA) |
| GTM Projects Spreadsheet | [Google Sheets](https://docs.google.com/spreadsheets/d/1Yb3zE-xvDUHsfiRaR75ggmMmOmkkgiDhgJ3WaVtRp10) |
| Community Hub | [community.anote.ai](https://community.anote.ai) |
| Dashboard (OpenAnote) | [dashboard.anote.ai](https://dashboard.anote.ai) |
| Panacea Chat | [chat.anote.ai](https://chat.anote.ai) |
| Past Showcase: Pale Blue Dot | [anote.ai/palebluedot](https://anote.ai/palebluedot) |
| Past Showcase: Panacea | [anote.ai/panacea](https://anote.ai/panacea) |
| arXiv Submission | [arxiv.org/submit](https://arxiv.org/submit) |
| AAAI 2027 | [aaai.org](https://aaai.org) |
| SIGIR 2027 | [sigir.org](https://sigir.org) |
| ACL Rolling Review | [aclrollingreview.org](https://aclrollingreview.org) |
| LaTeX Template | [Research/researchpapers/main.tex](https://github.com/anote-ai/Research/blob/main/researchpapers/main.tex) |

---

---

# SLIDE 30
# Let's Build

This summer you will:
- Produce research that a top AI conference will review
- Ship code that real users will use
- Present your work to a live audience on August 5
- Leave with an arXiv paper, a GitHub contribution record, and a network in the Anote community

Ten weeks from now, the best thing you can say is:
**"I built something real, and I can prove it."**

---

**Welcome to the Anote AI Research Fellowship.**
**We're glad you're here. Now let's get to work.**

---

*Anote AI Research Fellowship | Summer 2026 | June 1 – August 10*
*Program Lead: Natan | Program Manager: Rajshri*
*anote.ai | community.anote.ai | github.com/anote-ai*
