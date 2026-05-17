# Anote AI Research Fellowship — Live Calendar

This calendar tracks all fellowship events: weekly standups, speaker sessions, milestone deadlines, and conference submission dates.

## Subscribe (Read-Only)

Add the calendar to your preferred app using the iCal feed:

| App | How to subscribe |
|---|---|
| **Google Calendar** | Settings → Other calendars → From URL → paste the `.ics` URL below |
| **Apple Calendar** | File → New Calendar Subscription → paste URL |
| **Outlook** | Add calendar → From internet → paste URL |
| **Notion** | Use embed block with the URL |

**iCal URL** (once GitHub Pages is enabled):
```
https://anote-ai.github.io/anote-ai-research-fellowship/calendar/fellowship.ics
```

> **To enable GitHub Pages**: Go to repo Settings → Pages → Source: Deploy from branch `main`, folder `/ (root)`. The `.ics` file will then be live at the URL above.

## View as HTML

Open `calendar/index.html` in a browser, or visit the GitHub Pages URL:
```
https://anote-ai.github.io/anote-ai-research-fellowship/calendar/
```

## How to Add or Edit Events

1. Edit `calendar/events.yaml` — this is the source of truth
2. Open a PR with your changes
3. When merged, GitHub Actions automatically regenerates `fellowship.ics`

### Event format in `events.yaml`

```yaml
- title: "Weekly Research Standup"
  start: "2026-05-19T10:00:00"
  end: "2026-05-19T10:30:00"
  recurrence: "RRULE:FREQ=WEEKLY;BYDAY=TU"  # optional
  description: "Tuesday research sync"
  location: "Zoom (link in Slack #research channel)"
  category: standup  # standup | speaker | milestone | conference | social
```

### Categories

| Category | Color (in HTML view) | Examples |
|---|---|---|
| `standup` | Blue | Weekly Tue/Thu syncs |
| `speaker` | Purple | Guest speaker sessions |
| `milestone` | Orange | Fellow deliverable deadlines |
| `conference` | Green | AAAI, NeurIPS, ICLR deadlines |
| `social` | Pink | Fellowship social events |

## Automation

`.github/workflows/calendar-sync.yml` runs on every push to `main` that touches `calendar/events.yaml` and regenerates `fellowship.ics` automatically.
