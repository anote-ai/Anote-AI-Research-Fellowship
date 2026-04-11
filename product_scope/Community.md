# Armor — Community Hub

**Repo:** [anote-ai/Community](https://github.com/anote-ai/Community) · Public
**Live:** [community.anote.ai](https://community.anote.ai) | **Status:** Production

---

## What It Does

The Community repo powers **ARMOR** — Anote's public-facing AI community hub. It is a React SPA serving as a nationwide platform for AI builders, researchers, founders, and enthusiasts.

### Nine Core Feature Areas

| Area | Description |
|---|---|
| **Academy** | Hands-on learning programs, lectures, community-driven AI education |
| **Events** | Meetups, hackathons, workshops (virtual & in-person); AI Day Summit, Mindstone, PaleBlueDot |
| **Members** | Live member directory from Google Sheets API v4 (name, company, title, LinkedIn) |
| **Courses** | Self-paced learning tracks and open-source technical resources |
| **Content** | Blogs, presentations, and demos from community contributors |
| **Agents** | Domain-specific AI agent registry for practical workflows |
| **Coffee Chats** | 1-on-1 networking / mentorship with alumni and experienced members |
| **Job Referrals** | Warm introductions to recruiters at AI organizations |
| **Job Board** | Live remote ML/AI jobs from the Remotive API |

> No backend code in this repo — the backend API is external at `https://api.anote.ai`.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | React 18.3.1 (Create React App) |
| Routing | React Router DOM 6.23.1 |
| State | Redux Toolkit + Redux-Persist + Zustand |
| Styling | Tailwind CSS + Flowbite + Material-UI 5 + Emotion |
| Animation | Framer Motion |
| 3D / Visual | Spline 3D, D3.js 7.9.0, React-Simple-Maps |
| Content | React-Markdown, React-PDF, React-Doc-Viewer |
| HTTP | Axios |
| Analytics | React-GA4 (Google Analytics 4) |
| Payments | Stripe |
| External Data | Google Sheets API v4 (members), Remotive API (jobs) |
| Language | JavaScript 87.5%, CSS 12.3% |

---

## How to Run

### Prerequisites
Node.js + npm

```bash
cd frontend
npm install
npm start          # dev server at http://localhost:3000
```

Dev env points to `http://localhost:5000` (`.env.development`); production uses `https://api.anote.ai`.

**Required env vars:**
```
REACT_APP_API_ENDPOINT=http://localhost:5000
REACT_APP_STRIPE_PUBLISHABLE_KEY=pk_...
REACT_APP_GOOGLE_SHEETS_API_KEY=...
```

```bash
npm run build      # production build
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Add README with setup instructions** — no developer setup guide currently exists
- [ ] **Add `.env.example`** — document all required environment variables
- [ ] **Replace hardcoded event data with a CMS or API** — 30+ events in `ArmorEvents.js` are hardcoded; move to Notion/Contentful/JSON API so non-engineers can update events
- [ ] **Add CI pipeline** — GitHub Actions for lint + build check on every PR

### Features
- [ ] **Event RSVP system** — register for events directly from the portal (integrate with Google Calendar or Luma)
- [ ] **Member profiles** — richer profile pages linking to projects, blog posts, and agent contributions
- [ ] **Unified search** — search across events, members, jobs, agents, and blog posts
- [ ] **City chapter pages** — complete `CityOrganizer` and `LocalPOCs` for distributed chapter management
- [ ] **Newsletter signup** — capture emails from the landing page for event announcements
- [ ] **Agent submission form** — let community members submit new agents to the registry from the UI
- [ ] **Dark/light mode toggle** — currently dark-mode only

### Improvements
- [ ] **Lazy-load routes** — code-split per route to reduce initial bundle size
- [ ] **Accessibility (a11y) audit** — keyboard navigation and screen-reader support
- [ ] **Mobile responsiveness** — audit pages on small screens; several use fixed pixel widths
- [ ] **Consolidate state managers** — app uses both Redux and Zustand; pick one
- [ ] **Remove `* copy.js` files** — clean up experimental component duplicates from the source tree
- [ ] **SEO** — expand React-Helmet metadata; add schema.org/Event structured data
