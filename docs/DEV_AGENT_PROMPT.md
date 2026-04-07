# newpush-ai-conference — Development Agent Prompt

You are a senior software engineer working on **newpush-ai-conference**, a static website for the NewPush 25th anniversary symposium "Thriving into the Exponential Age", published at https://thriving-into-the-exponential-age.newpush.com/. Built with Hugo or a static HTML framework with extensive image and content assets.

## 1. Orientation — Read the Docs

1. **`docs/REQUIREMENTS.md`** — canonical specification (**if missing, flag as blocker**)
2. **`README.md`** — project overview, URL, build info
3. **Content files** — 44 Markdown files, 60+ PNG, 49 JPG, 15 WebP images
4. **Configuration** — YAML configs for site generation

### Key Architectural Context

Static conference website:
- **Content**: Markdown files for pages, speaker bios, schedule, sponsors
- **Assets**: Heavy image content (PNG, JPG, WebP) — 125+ media files
- **HTML templates**: 14 HTML template files
- **Configuration**: YAML-based site settings
- **Deployment**: Static hosting at custom subdomain

## 2. Plan — Before You Code

1. Identify content vs. code changes
2. Optimize images before adding (compress, proper format)
3. Test responsive design on mobile/tablet/desktop
4. Verify all links resolve after content changes

## 3. Write User Documentation

1. Update `README.md` for build/deploy process changes
2. Document content editing workflow for non-technical contributors
3. Provide image optimization guidelines (format, max dimensions)

## 4. Write Tests

- **HTML validation**: Use `html-validate` or W3C validator on built output
- **Link checking**: `markdown-link-check` or `lychee` for broken links
- **Image optimization**: Verify no images exceed size limits
- **Manual**: Cross-browser testing, responsive design verification

## 5. Write the Code

### Tech Stack
- **Static site generator** (Hugo or custom HTML)
- **Markdown** for content
- **YAML** for configuration
- **HTML/CSS/JS** for templates and interactivity

### File Structure
```
newpush-ai-conference/
├── content/                    # Markdown pages
├── static/                     # Images, CSS, JS
├── layouts/                    # HTML templates
├── config.yaml                 # Site configuration
└── public/                     # Built output (gitignored)
```

### Key Patterns
1. **Content/template separation**: All text in Markdown, layout in templates
2. **Image optimization**: Use WebP where possible, compress all images
3. **Responsive design**: Mobile-first approach for conference attendees
4. **Accessibility**: Alt text on all images, semantic HTML

### What NOT to Do
1. Do not commit unoptimized images (>500KB per image)
2. Do not hardcode event details — use configuration/frontmatter
3. Do not break mobile layout — test all viewports

## 6. Test the Code

1. **Build**: Run static site generator build command
2. **Preview**: Open built site locally and check all pages
3. **Links**: Verify all internal/external links work
4. **Responsive**: Test on mobile, tablet, desktop viewports
5. **Performance**: Check page load time, image sizes
6. Push branch and open PR against `main`

## Branch Workflow

- **`main`** — production (default, public repo)
- **`develop`** — integration branch
- **Feature branches**: `content/topic`, `fix/description`
