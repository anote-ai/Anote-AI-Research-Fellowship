# Armor (Community) — Product Summary

**Repo:** [anote-ai/Community](https://github.com/anote-ai/Community)
**Live:** [community.anote.ai](https://community.anote.ai) | **Status:** Production

---

## What It Does

The Community repo powers **ARMOR** — Anote's public-facing AI community hub at community.anote.ai. It is a React SPA serving as a nationwide platform for AI builders, researchers, founders, and enthusiasts.

### Nine Core Feature Areas

| Area | Description |
|---|---|
| **Academy** | Hands-on learning programs, lectures, and community-driven AI education |
| **Events** | Meetups, hackathons, workshops (virtual and in-person); AI Day Summit, Mindstone, Panacea, PaleBlueDot |
| **Members** | Live member directory sourced from Google Sheets API v4 (name, company, title, LinkedIn) |
| **Courses** | Self-paced learning tracks and open-source technical resources |
| **Content** | Blogs, presentations, and demos from community contributors |
| **Agents** | Domain-specific AI agent registry for practical workflows |
| **Coffee Chats** | One-on-one networking / mentorship with alumni and experienced members |
| **Job Referrals** | Warm introductions to recruiters at AI organizations |
| **Job Board** | Live remote ML/AI job listings from the Remotive API |

There is **no backend code in this repo** — the backend API is external at `https://api.anote.ai`.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | React 18.3.1 (Create React App) |
| Routing | React Router DOM 6.23.1 |
| State Management | Redux Toolkit + Redux-Persist + Zustand |
| Styling | Tailwind CSS + Flowbite + Material-UI 5 + Emotion |
| Animation | Framer Motion |
| 3D / Visual | Spline 3D, D3.js 7.9.0, React-Simple-Maps |
| Content Rendering | React-Markdown, React-PDF, React-Doc-Viewer |
| HTTP | Axios |
| Analytics | React-GA4 (Google Analytics 4, ID: G-CMN1GX5JE1) |
| Payments | Stripe (publishable key in env) |
| External Data | Google Sheets API v4 (member directory), Remotive API (job board) |
| Icons | FontAwesome 6.5.2, Lucide-React |
| Language split | JavaScript 87.5%, CSS 12.3%, HTML 0.2% |

---

## How to Run

### Prerequisites
- Node.js + npm

### Steps
```bash
cd frontend
npm install
npm start          # dev server at http://localhost:3000
```

The dev environment points to `http://localhost:5000` for the backend (set in `.env.development`). Production uses `https://api.anote.ai`.

```bash
# Production build
npm run build
```

**Environment variables needed:**
- `REACT_APP_API_ENDPOINT` — backend API URL
- `REACT_APP_STRIPE_PUBLISHABLE_KEY` — Stripe key (placeholder `"p"` in dev)
- `REACT_APP_GOOGLE_SHEETS_API_KEY` — for live member directory

There is no Docker or server-side setup needed (frontend-only repo).

---

## TODOs & Enhancements

### High Priority
- [ ] **Add a README with setup instructions** — The repo has no developer setup guide; new contributors have no documented path to run the project locally
- [ ] **Add `.env.example`** — Document all required environment variables
- [ ] **Add CI pipeline** — GitHub Actions for lint + build check on every PR
- [ ] **Replace hardcoded event data with a CMS or API** — The 30+ events in `ArmorEvents.js` are hardcoded strings; moving to a CMS (Notion, Contentful, or a simple JSON API) would enable non-engineers to update events

### Features
- [ ] **Event RSVP system** — Allow users to register for events directly from the community portal; integrate with a calendar (Google Calendar, Luma)
- [ ] **Member profiles** — Link member directory entries to richer profile pages (projects, blog posts, agent contributions)
- [ ] **Search across all content** — Unified search across events, members, jobs, agents, and blog posts
- [ ] **City chapter pages** — Complete the `CityOrganizer` and `LocalPOCs` components to support distributed chapter management
- [ ] **Newsletter signup** — Capture emails directly from the landing page for event announcements and updates
- [ ] **Dark/light mode toggle** — Currently dark-mode only; offer a user-controlled toggle
- [ ] **Agent submission form** — Let community members submit new agents to the ARMOR Agent Registry from the UI

### Improvements
- [ ] **Lazy-load routes** — Split code per route to reduce initial bundle size (the current CRA bundle is large)
- [ ] **Accessibility (a11y) audit** — Ensure keyboard navigation and screen-reader support across all components
- [ ] **Mobile responsiveness** — Audit all pages on small screens; several components use fixed pixel widths
- [ ] **Remove duplicate state managers** — App uses both Redux and Zustand; consolidate to reduce confusion
- [ ] **Consolidate copy variants** — Remove `* copy.js` component files from source tree (move to a proper branch/feature flag workflow)
- [ ] **SEO improvements** — Expand React-Helmet metadata per page; add structured data for events (schema.org/Event)
