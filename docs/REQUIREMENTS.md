# newpush-ai-conference — REQUIREMENTS

> **Status**: Initial skeleton, written 2026-05-26 to close issue #2. This
> document captures the project as it exists today and serves as the canonical
> specification for future work. Items marked **GAP** are confirmed
> discrepancies between this spec and the current implementation; items marked
> **OPEN QUESTION** need PO input via `docs/CLARIFICATIONS.md` before
> implementation.

## 1. Project Overview

### 1.1 Purpose

`newpush-ai-conference` is the public marketing website for **BAISS — the
Budapest AI Security Symposium**, NewPush's 25th-anniversary event with the
tagline *"Thriving into the Exponential Age"*. The site is the primary
shop-front for ticket sales, agenda communication, speaker promotion, and
sponsor visibility.

### 1.2 Canonical facts

| Item            | Value                                                          |
| --------------- | -------------------------------------------------------------- |
| Brand           | BAISS — Budapest AI Security Symposium                         |
| Tagline         | Thriving into the Exponential Age                              |
| Event date      | 2025-10-03                                                     |
| Venue           | Ludovika University of Public Service, Orczy Úti Kollégium     |
| Address         | 1089 Budapest, Orczy út 1.                                     |
| Production URL  | https://thriving-into-the-exponential-age.newpush.com/         |
| Ticket vendor   | TixTree (in-person + live-stream tracks)                       |
| Hosting         | Netlify                                                        |
| Repo visibility | Public                                                         |

Single source of truth for these values: `config/_default/hugo.yaml`,
`config/_default/params.yaml`, `config/_default/menus.yaml`, and
`content/_index.md`. Any drift across those files is a defect (see §6 Gaps).

### 1.3 Audience

- Prospective in-person attendees (executives, policy makers, security
  practitioners) — Hungarian and English speakers.
- Live-stream attendees (geographically distributed).
- Sponsors evaluating brand placement.
- Speakers checking their own listing.
- NewPush staff editing copy via Decap CMS.

## 2. Functional Requirements

### 2.1 Site sections (in render order on `/`)

Defined in `content/_index.md`. Each section is a HugoBlox `block`.

| ID         | Block type           | Purpose                                        |
| ---------- | -------------------- | ---------------------------------------------- |
| top        | hero-with-stats      | Event title, date, venue, primary ticket CTA   |
| —          | countdown            | Countdown to event start                       |
| about      | cta-image-paragraph  | Three narrative blocks: keynotes, panels, tech |
| speakers   | speakers             | Speaker grid, sourced from `content/authors/`  |
| agenda     | my-events            | Main auditorium track (`data/events.json`)     |
| agenda2    | my-events            | Tech track (`data/events2.json`)               |
| —          | logos                | Sponsor wall (`assets/media/sponsors/`)        |

**Acceptance**: removing any section from `_index.md` should not break the
build. Adding a section must follow the existing HugoBlox block schema.

### 2.2 Navigation

Defined in `config/_default/menus.yaml`.

**Main nav (header)**: Home, About, Speakers, Agenda, Contact, Live Stream.
External links (Contact, Live Stream, Get Tickets CTA) open the tixtree /
newpush.com targets defined in that file.

**Footer nav**: three columns — Home, Tickets, Legal. Includes a "Download
Agenda" link that must point at the current-year PDF in `/static/pdfs/`.

**Acceptance**:
- All internal anchors (`/#about`, `/#speakers`, `/#agenda`) resolve to a
  section with the matching `id`.
- All external links return HTTP 200 at deploy time (link check, §4.2).
- The "Download Agenda" footer entry points at a PDF that exists in
  `/static/pdfs/` and reflects the current event year. **GAP** today: the
  link in `menus.yaml` points at `Agenda_BAISS_NKE_ NOV_15_2024.pdf`, a
  2024-dated file that pre-dates the current 2025-10-03 event.

### 2.3 Speakers

- Each speaker has a directory under `content/authors/<Name>/` with an
  `_index.md` (frontmatter only — name, role, organization, social links,
  bio) and an `avatar.jpg` plus an optional `cropped/image.jpg`.
- A second set of profiles lives under `content/_authors/` (6 entries).
  **OPEN QUESTION**: are `content/authors/` and `content/_authors/` two
  legitimate directories (e.g. published vs. draft), or is one a historical
  leftover? Decision needed before any cleanup PR.
- Speakers appear in the `speakers` block of `_index.md` when their
  frontmatter `user_groups` contains `Speakers`.

**Acceptance**: every speaker rendered on the homepage has an avatar,
a non-empty name, and a non-empty role/affiliation.

### 2.4 Agenda

Two parallel JSON files drive two parallel tracks:

- `data/events.json` — main auditorium (154 lines today, ~20 sessions).
- `data/events2.json` — tech track (49 lines today, ~6 sessions).

Schema per event entry:

```json
{
  "time": "9:00-9:30",          // required, "HH:MM-HH:MM"
  "event": "...",                // required, short title
  "moderator": "Name, Org",      // optional
  "speakers": ["Name, Org", ...] // required (array, may be empty for breaks)
}
```

**Acceptance**:
- Both files are valid JSON.
- `time` values within a track are non-overlapping and chronologically
  ordered.
- Any speaker referenced in agenda copy SHOULD also have a profile under
  `content/authors/` (warning, not blocker).

### 2.5 Sponsors

- Logo images in `assets/media/sponsors/`, rendered by the `logos` block.
- Order is filesystem-determined. **GAP**: filenames today are generic
  (`image.png`, `image copy 2.png` … `image copy 15.png`), which produces
  an unpredictable ordering and makes attribution-by-filename impossible.
  Renaming to `<sponsor-slug>.png` is recommended but **OPEN QUESTION**
  whether order matters (alphabetical vs. tier-based).

**Acceptance**: every PNG in `assets/media/sponsors/` corresponds to a real
sponsor (no leftover test images).

### 2.6 Legal pages

- `/privacy` (`content/privacy.md`) — Privacy Statement.
- `/terms` (`content/terms.md`) — Terms and Conditions.

Both are reachable from the footer.

**Acceptance**: both pages render with no missing frontmatter fields and no
broken links.

### 2.7 Ticketing integration

- All "Get Tickets" CTAs link to the canonical TixTree event URL defined in
  `params.yaml > header.button.url`.
- The live-stream CTA links to a separate TixTree URL defined in
  `menus.yaml`.

**Acceptance**: there is exactly one canonical TixTree URL per ticket type
in the codebase. Hard-coded TixTree URLs in MD/HTML are forbidden;
references must go through `params.yaml` / `menus.yaml`.

### 2.8 Content management

- Decap CMS is loaded via the HugoBlox `blox-plugin-decap-cms` module
  (`config/_default/module.yaml`). The admin UI is served at `/admin`.
- Non-technical contributors edit speakers, agenda JSON, and homepage copy
  through Decap.

**Acceptance**: a non-technical editor can add a speaker (name, role, bio,
avatar) and have the change appear on the next Netlify build without
touching code.

## 3. Non-Functional Requirements

### 3.1 Performance

- Hugo build (`hugo --gc --minify`) completes in under 3 minutes on Netlify.
- No single image asset exceeds **500 KB** on disk (per DEV_AGENT_PROMPT).
- Total page weight for `/` is under 5 MB after minification.
- Lighthouse Performance score ≥ 80 on a clean Netlify production build.

### 3.2 Accessibility

- All `<img>` tags carry meaningful `alt` text.
- Semantic HTML (`<nav>`, `<main>`, `<header>`, `<footer>`) in templates.
- Color contrast meets WCAG 2.1 AA on the `newpush` brand palette
  (`params.yaml > appearance.color`).
- Keyboard navigation reaches all interactive elements (header CTA, footer
  links, ticket buttons).

### 3.3 SEO

- `<title>` driven by `hugo.yaml > title` plus per-page frontmatter.
- Open Graph and Twitter meta tags populated from `params.yaml > marketing.seo`.
- `sitemap.xml` and `robots.txt` generated by Hugo on every build.
- Google Tag Manager container `GTM-P8QPQJQ` is injected in production.

### 3.4 Browser support

- Latest two versions of Chrome, Firefox, Safari, and Edge.
- iOS Safari and Chrome Android on devices ≥ iPhone SE / 360px viewport.

### 3.5 i18n

- `defaultContentLanguage: en` (English only today).
- Site is structurally bilingual-ready (`languages.yaml` documents how to
  add `zh` / a second locale) but Hungarian content is **not** yet wired
  in. **OPEN QUESTION**: should a Hungarian locale be added before the
  event?

### 3.6 Security / privacy

- No third-party tracker beyond GTM (`GTM-P8QPQJQ`) and the embedded
  TixTree links.
- Privacy and Terms pages are kept in sync with the master copies maintained
  by NewPush Legal.
- The `GIT_TOKEN` Netlify env var (used for HugoBlox all-access private
  modules — see `netlify.toml`) must not be logged in build output. **GAP**
  today: `netlify.toml` lines 3–4 echo `$GIT_TOKEN` and `$GOPRIVATE` during
  build; that needs to be removed before next deploy.

## 4. Build, Test, and Deploy

### 4.1 Build

- Local: `hugo serve -D` (binds to `:1313`).
- Production: `hugo --gc --minify -b $URL` (see `netlify.toml`).
- Hugo version pin: `HUGO_VERSION = "0.148.2"`.
- Theme modules: `github.com/HugoBlox/hugo-blox-builder/modules/blox-*`
  pulled via Go modules; private all-access module requires `GIT_TOKEN`.

### 4.2 Tests

No automated test suite exists today. The DEV_AGENT_PROMPT prescribes the
following minimum gate, to be added incrementally:

1. **Markdown link check** (`lychee` or `markdown-link-check`) on every PR.
2. **HTML validation** (`html-validate` or W3C) on built `public/` output.
3. **Image size check** — fail CI if any file in `static/` or
   `assets/media/` exceeds 500 KB.
4. **Manual cross-browser pass** on a Netlify deploy preview before merge
   to `main`.

**Acceptance**: at least one of (1)–(3) is wired into GitHub Actions before
the next major content overhaul.

### 4.3 Deployment

- Netlify auto-deploys `main` → production at
  `thriving-into-the-exponential-age.newpush.com`.
- `develop` and feature branches produce deploy previews.
- `.github/workflows/require-develop-source.yml` enforces that any PR to
  `main` must originate from the `develop` branch — feature branches must
  merge into `develop` first.

### 4.4 Branching

- `main` — production.
- `develop` — integration.
- Feature branches: `content/<topic>`, `fix/<short-description>`,
  `doc/<short-description>`.

Direct pushes to `main` and `develop` are not permitted; both are PR-only.

## 5. Integration Requirements

| Integration         | Purpose                                  | Config / location                                 |
| ------------------- | ---------------------------------------- | ------------------------------------------------- |
| TixTree             | Ticket sales (in-person + live stream)   | `params.yaml`, `menus.yaml`                       |
| Netlify             | Hosting + build                          | `netlify.toml`                                    |
| Google Tag Manager  | Analytics container                      | `params.yaml > marketing.analytics`               |
| HugoBlox modules    | Theme, blocks, Decap CMS plugin          | `config/_default/module.yaml`, `go.mod`, `go.sum` |
| Decap CMS           | Editorial UI at `/admin`                 | HugoBlox module `blox-plugin-decap-cms`           |
| ConvertKit          | Newsletter signup (currently disabled)   | `params.yaml > extensions.convertkit.api_key`     |

Adding a new integration requires (a) a config entry in the appropriate
file, (b) documentation here, and (c) confirmation that no secret material
is committed.

## 6. Current Status / Implementation Gaps

Confirmed discrepancies as of 2026-05-26. Each should become its own GitHub
issue if not already tracked.

1. **Footer branding drift** — `params.yaml > footer.content.logo.text`
   reads `"26th AI SUMMIT 2025"`, contradicting the `BAISS` /
   `25th anniversary symposium` identity used everywhere else. Either the
   string or the rest of the site is wrong.
2. **Stale agenda PDF link** — `menus.yaml` "Download Agenda" entry points
   at `Agenda_BAISS_NKE_ NOV_15_2024.pdf` (2024-dated); the canonical 2025
   agenda PDF is `25th_anniversary_symposium_agenda.pdf` in the same
   directory.
3. **Live-stream URL is from a previous event** —
   `menus.yaml > main.Live Stream` and the footer "Register for the live
   stream" entry both point at `baiss-2024-live-stream-cac7d14acebc`. The
   2025 live-stream listing (if it exists) needs to be substituted.
4. **Duplicate speaker directories** — `content/authors/` and
   `content/_authors/` both contain speaker profiles. Relationship is
   undocumented (see §2.3 OPEN QUESTION).
5. **Sponsor image filenames are generic** — `image copy N.png` pattern in
   `assets/media/sponsors/`. Should be `<sponsor-slug>.png` for
   attribution and ordering (see §2.5).
6. **`netlify.toml` leaks env vars in build logs** — `echo "$GIT_TOKEN"`
   lines 3–4 print the GitHub token in plaintext on every Netlify build.
   This is a security finding and should be removed.
7. **No automated CI tests** — link check, HTML validation, and image-size
   gate are all absent (see §4.2).
8. **`README.md` is a Hugo install guide, not a project README** — does
   not describe the project, the deployment, the branching model, or
   where to find this REQUIREMENTS doc.

## 7. Decision Log References

- 2026-05-26 — Created this file to close issue #2. No design decisions
  made; this is a descriptive snapshot of the codebase as found.

## 8. Maintenance

- Update this file whenever event metadata changes (date, venue, ticket
  URL, sponsor list, speaker roster).
- When a §6 gap is closed, remove or move the corresponding entry to the
  Decision Log (above).
- Any new PR that changes a §1.2 canonical value must also update this
  file in the same commit.
