# Anote Product — Fellow Matching

**Summer 2026 | Anote AI Research Fellowship**

Each fellow is assigned to own one Anote product for the summer. Their goal is to meaningfully improve it using Claude Code or Codex — shipping new features, fixing bugs, improving documentation, and leaving the repo in better shape than they found it.

> **Access:** All repos are under [github.com/anote-ai](https://github.com/orgs/anote-ai/repositories).
> Every fellow will be provisioned with Claude Code or Codex access at orientation (June 1).

---

## Product Assignments

| # | Product | Repo | Description | Status | Live URL | Summary | Assigned Fellow |
|---|---------|------|-------------|--------|----------|---------|-----------------|
| 1 | **MLOps Platform** (OpenAnote) | [anote-ai/OpenAnote](https://github.com/anote-ai/OpenAnote) | End-to-end MLOps platform for data labeling, fine-tuning, SDK, and chatbot | Production | [dashboard.anote.ai](https://dashboard.anote.ai/) | [📄 Summary](https://github.com/anote-ai/OpenAnote/blob/main/SUMMARY.md) | _TBD_ |
| 2 | **Panacea** (Autonomous Intelligence) | [anote-ai/Autonomous-Intelligence](https://github.com/anote-ai/Autonomous-Intelligence) | Multi-agent orchestration framework supporting agent coordination and task completion | Production | [chat.anote.ai](https://chat.anote.ai) | [📄 Summary](https://github.com/anote-ai/Autonomous-Intelligence/blob/main/SUMMARY.md) | _TBD_ |
| 3 | **Armor** (Community) | [anote-ai/Community](https://github.com/anote-ai/Community) | Community and events hub for AI knowledge sharing and collaboration | Production | [community.anote.ai](https://community.anote.ai) | [📄 Summary](https://github.com/anote-ai/Community/blob/main/SUMMARY.md) | _TBD_ |
| 4 | **Model Leaderboard** | [anote-ai/Leaderboard](https://github.com/anote-ai/Leaderboard) | LLM performance rankings with evolving competition and expert evaluations | POC | [anote.ai/leaderboard](https://anote.ai/leaderboard) | [📄 Summary](https://github.com/anote-ai/Leaderboard/blob/main/SUMMARY.md) | _TBD_ |
| 5 | **Synthetic Data** | [anote-ai/Synthetic-Data](https://github.com/anote-ai/Synthetic-Data) | Generate synthetic datasets across modalities (text, image, audio, etc.) | POC | [anote.ai/syntheticdata](https://anote.ai/syntheticdata) | [📄 Summary](https://github.com/anote-ai/Synthetic-Data/blob/main/SUMMARY.md) | _TBD_ |
| 6 | **Private Chatbot** (PrivateGPT Desktop) | [anote-ai/PrivateGPT-Desktop](https://github.com/anote-ai/PrivateGPT-Desktop) | Secure private chatbot desktop app with zero-shot models for on-premise deployment | POC | [anote.ai/downloadprivategpt](https://anote.ai/downloadprivategpt) | [📄 Summary](https://github.com/anote-ai/PrivateGPT-Desktop/blob/main/SUMMARY.md) | _TBD_ |
| 7 | **Slackbot** | [anote-ai/Slackbot](https://github.com/anote-ai/Slackbot) *(private)* | AI-powered Slack integration enabling Anote workflows, Q&A, and automation directly within Slack | — | — | — | _TBD_ |
| 8 | **AI RFPs** | [anote-ai/AI-RFPs](https://github.com/anote-ai/AI-RFPs) *(private)* | AI-assisted tool for generating, managing, and responding to Requests for Proposals | — | — | — | _TBD_ |
| 9 | **Upreach** | [anote-ai/Upreach](https://github.com/anote-ai/Upreach) *(private)* | AI-powered outreach and sales engagement platform for automating and personalizing prospect communication | — | — | — | _TBD_ |
| 10 | **AI Assisted Coding Tool** | [anote-ai/AI-Assisted-Coding-Tool](https://github.com/anote-ai/AI-Assisted-Coding-Tool) *(private)* | Production-grade AI coding assistant (CLI, Web UI, VS Code extension) built on Claude Agent SDK, with full codebase access, file editing, and streaming responses | Production | — | — | _TBD_ |

---

## Notes for Fellows

- **Before June 3 standup:** Confirm repo access and set up local dev environment.
- **Week 1 goal:** Explore the codebase, read existing docs, open issues, and write a short improvement plan.
- **Ongoing:** Ship improvements each sprint. Bring blockers to the Thursday AI Product Standup.
- **By August 10:** All PRs merged, code documented, README updated, and work handed off cleanly.

### Suggested Contribution Areas (pick what's relevant to your product)
- [ ] New feature or capability
- [ ] Performance improvements
- [ ] Bug fixes
- [ ] Better test coverage
- [ ] Improved documentation / README
- [ ] UI/UX polish
- [ ] Integration with other Anote products

---

## Product Experiment Breakdown

Fellows should work with their product mentor to break down their assignment into 2-3 concrete experiments. Below is a template for scoping and prioritizing work:

### Experiment Planning Template

For each product, define **2–3 concrete experiments** by Week 1 (June 9):

1. **Experiment Name**: Short, descriptive title
2. **Problem Statement**: What pain point or opportunity does this solve?
3. **Success Criteria**: How will you measure success? (e.g., performance gain, user feedback, code coverage %)
4. **Scope**:
   - [ ] Epic (3+ weeks, multiple PRs)
   - [ ] Feature (1–2 weeks, 1–2 PRs)
   - [ ] Bug / Polish (< 1 week, 1 PR)
5. **Dependencies**: Any blocking work or external dependencies?
6. **Acceptance Checklist**:
   - [ ] Code merged to main
   - [ ] Tests pass (new tests added if applicable)
   - [ ] Documentation updated
   - [ ] Handoff notes written for next maintainer

### Example Breakdown by Product Area

#### MLOps Platform (OpenAnote)
**Primary experiments could include:**
- [ ] **Exp 1: Streaming Labelbot Responses** — Add real-time streaming for label predictions to reduce latency. Success: <100ms per token. Scope: Epic
- [ ] **Exp 2: Fine-tuning Pipeline Observability** — Add detailed logging & dashboards for fine-tuning jobs. Success: 90%+ of jobs tracked, zero lost jobs. Scope: Feature
- [ ] **Exp 3: SDK Documentation Revamp** — Improve SDK docs with working code examples and quickstart guide. Success: docs site traffic +50%. Scope: Feature

#### Panacea (Autonomous Intelligence)
**Primary experiments could include:**
- [ ] **Exp 1: Agent Failure Recovery** — Implement graceful fallback logic when agent tools fail mid-execution. Success: <5% unrecovered failures. Scope: Feature
- [ ] **Exp 2: Multi-Agent Coordination Patterns** — Implement round-robin task allocation across agents. Success: 20% faster job completion. Scope: Epic
- [ ] **Exp 3: Agent Audit Trail** — Log all agent decisions and tool calls for compliance. Success: 100% of actions logged and queryable. Scope: Feature

#### Armor (Community)
**Primary experiments could include:**
- [ ] **Exp 1: Search Performance Optimization** — Index community posts in a semantic vector database. Success: search latency <200ms, relevance +30%. Scope: Epic
- [ ] **Exp 2: Event Registration Automation** — Auto-populate calendar invites and send reminders. Success: 90% RSVP rate. Scope: Feature
- [ ] **Exp 3: User Onboarding Flow** — Redesign first-time user journey with in-app walkthrough. Success: completion rate >70%. Scope: Feature

#### Model Leaderboard
**Primary experiments could include:**
- [ ] **Exp 1: Continuous Evaluation Pipeline** — Auto-run evals on new models submitted weekly. Success: zero manual eval runs. Scope: Epic
- [ ] **Exp 2: Leaderboard API** — Expose leaderboard data via REST/GraphQL for third-party integrations. Success: 3+ integration partners. Scope: Feature
- [ ] **Exp 3: Model Comparison Tool** — Add side-by-side model performance analysis. Success: 50% user engagement increase. Scope: Feature

#### Synthetic Data
**Primary experiments could include:**
- [ ] **Exp 1: Multimodal Generation** — Extend synthetic data generation to support video & 3D meshes. Success: generate 1000 realistic videos/week. Scope: Epic
- [ ] **Exp 2: Quality Metrics Dashboard** — Add automated data quality scoring (distribution shift, bias detection). Success: all generated datasets scored. Scope: Feature
- [ ] **Exp 3: Domain-Specific Templates** — Pre-build generation templates for finance, healthcare, legal. Success: 5+ templates with examples. Scope: Feature

#### Private Chatbot (PrivateGPT Desktop)
**Primary experiments could include:**
- [ ] **Exp 1: Local Model Switching** — Allow users to swap between different local LLMs (Llama 2, Mistral, etc.) without redownload. Success: <2 second model switch. Scope: Feature
- [ ] **Exp 2: Document Chunking Strategy Optimization** — Test adaptive chunking strategies for legal/medical PDFs. Success: 25% improvement in retrieval accuracy. Scope: Feature
- [ ] **Exp 3: Performance Profiling & Optimization** — Reduce memory footprint by 30% for the electron app. Success: app launches in <3s on MacBook. Scope: Epic

#### Slackbot
**Primary experiments could include:**
- [ ] **Exp 1: Slash Command Registry** — Implement pluggable slash commands for common Anote workflows (/label, /annotate, /feedback). Success: 5+ commands, 80% user adoption. Scope: Epic
- [ ] **Exp 2: Message Threading Integration** — Auto-thread Slackbot responses to reduce noise. Success: 0 off-topic replies. Scope: Feature
- [ ] **Exp 3: Analytics Dashboard** — Track command usage, response quality, and user satisfaction across teams. Success: dashboard deployed, 10+ metrics tracked. Scope: Feature

#### AI RFPs
**Primary experiments could include:**
- [ ] **Exp 1: RFP Auto-Generation from Requirements** — Given customer requirements doc, auto-generate RFP outline & sections. Success: 50% faster RFP creation. Scope: Epic
- [ ] **Exp 2: Prior RFP Search** — Build semantic search over past RFP wins to identify patterns & reusable sections. Success: 20% faster RFP completion. Scope: Feature
- [ ] **Exp 3: Compliance Checker** — Auto-scan RFPs for missing compliance clauses (SOC 2, GDPR, etc.). Success: zero non-compliant RFPs shipped. Scope: Feature

#### Upreach
**Primary experiments could include:**
- [ ] **Exp 1: Personalized Email Sequences** — Auto-generate multi-email sequences tailored to prospect profile. Success: 25% higher open rate vs. templates. Scope: Epic
- [ ] **Exp 2: Objection Handling Bot** — Detect prospect objections in replies and suggest responses. Success: reduce sales follow-up time by 30%. Scope: Feature
- [ ] **Exp 3: Campaign ROI Attribution** — Link outreach campaigns to closed deals and calculate true ROI. Success: 100% deal attribution, revenue dashboard live. Scope: Feature

#### AI Assisted Coding Tool
**Primary experiments could include:**
- [ ] **Exp 1: Multi-Language Support** — Extend Claude Agent SDK to support Python, Go, Rust, Java projects. Success: 4+ languages tested and documented. Scope: Epic
- [ ] **Exp 2: Streaming Code Edits** — Stream back code changes as they're generated rather than wait for full response. Success: <500ms time-to-first-edit. Scope: Feature
- [ ] **Exp 3: Workspace Dependency Resolver** — Auto-parse package.json/requirements.txt and include relevant type stubs in context. Success: 40% reduction in "package not found" errors. Scope: Feature

---

## Product Standup Cadence

| Day | Time (EST) | Event |
|-----|-----------|-------|
| Every Thursday | 5:00 PM – 5:30 PM | AI Product Standup (sprint review, blockers, demos) |

---

*Last updated: Summer 2026 Fellowship Kickoff*
