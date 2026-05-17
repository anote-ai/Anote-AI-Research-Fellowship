#!/usr/bin/env python3
"""Generate fellowship.ics from events.yaml."""
import sys
import uuid
from datetime import datetime, timezone

try:
    import yaml
except ImportError:
    print("pyyaml not installed. Run: pip install pyyaml", file=sys.stderr)
    sys.exit(1)

CALENDAR_HEADER = """BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Anote AI//Research Fellowship//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
X-WR-CALNAME:Anote AI Research Fellowship
X-WR-CALDESC:Events for the Anote AI Research Fellowship Summer 2026
X-WR-TIMEZONE:America/New_York
"""

CALENDAR_FOOTER = "END:VCALENDAR\n"


def dt_to_ical(dt_str: str) -> str:
    dt = datetime.fromisoformat(dt_str)
    return dt.strftime("%Y%m%dT%H%M%S")


def now_utc() -> str:
    return datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")


def event_to_vevent(event: dict) -> str:
    uid = str(uuid.uuid4())
    dtstamp = now_utc()
    dtstart = dt_to_ical(event["start"])
    dtend = dt_to_ical(event["end"])
    title = event["title"].replace(",", "\\,").replace("\n", "\\n")
    desc = event.get("description", "").replace(",", "\\,").replace("\n", "\\n")
    location = event.get("location", "").replace(",", "\\,")
    category = event.get("category", "").upper()
    recurrence = event.get("recurrence", "")

    lines = [
        "BEGIN:VEVENT",
        f"UID:{uid}",
        f"DTSTAMP:{dtstamp}",
        f"DTSTART;TZID=America/New_York:{dtstart}",
        f"DTEND;TZID=America/New_York:{dtend}",
        f"SUMMARY:{title}",
    ]
    if desc:
        lines.append(f"DESCRIPTION:{desc}")
    if location:
        lines.append(f"LOCATION:{location}")
    if category:
        lines.append(f"CATEGORIES:{category}")
    if recurrence:
        lines.append(recurrence)
    lines.append("END:VEVENT")
    return "\n".join(lines)


def main():
    with open("calendar/events.yaml") as f:
        events = yaml.safe_load(f)

    ics = CALENDAR_HEADER
    for event in events:
        ics += event_to_vevent(event) + "\n"
    ics += CALENDAR_FOOTER

    with open("calendar/fellowship.ics", "w") as f:
        f.write(ics)

    print(f"Generated calendar/fellowship.ics with {len(events)} events.")


if __name__ == "__main__":
    main()
