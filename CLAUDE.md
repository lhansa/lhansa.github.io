# CLAUDE.md

Repo guide for agent sessions working on this project. Read this before touching anything.

## What this is

Hugo blog/newsletter landing site for leonardohansa.com. All content is currently in Spanish.

## Build and deploy

- Hugo **0.145.0 extended**.
- Deploy: `.github/workflows/hugo.yaml` builds and deploys to GitHub Pages on every push to `main`.
- Local dev: `hugo server -D`
- Production build (what CI runs): `hugo --gc --minify --baseURL "https://leonardohansa.com/"`
- The `--baseURL` flag on the CLI overrides `baseurl` in `config.toml`.

## Layout precedence

Theme `hugo-tanka` is vendored in `themes/`, but `layouts/` at the repo root overrides everything that matters (Hugo's normal lookup order). **Edit `layouts/`, never `themes/`.**

## Content sections and their templates

- `content/` root — 18 pages, no dedicated section template, most render via `layouts/_default/single.html`.
- `content/correos/` — 21 files. Template: `layouts/correos/single.html`.
- `content/post/` — 15 files. Template: `layouts/post/single.html`.
- `content/audios/` — 1 content file + audio assets (`.aac`/`.mp3`). Template: `layouts/audios/single.html`.
- `venta` and `forms` are **not directories** — they're front-matter `type:` values set on individual root-level pages, routed to `layouts/venta/single.html` and `layouts/forms/single.html` respectively (e.g. `content/de-excel-a-r.md` has `type: "venta"`; `content/consultoria.md` has `type: "forms"`).
- `layouts/porsiaca.html` — a standalone alternate-homepage template, not currently wired to any content file or config. Leave it alone unless a task specifically asks about it.
- `layouts/index.html` — the homepage template. It is now just `header` + `{{ .Content }}` + `footer`; all the homepage copy lives in `content/_index.md` so it can be translated per language (issue #5).
- `content/_index.md` — the homepage copy. Front matter is deliberately minimal: `title` **must** stay `"Leonardo Hansa"` (Hugo's internal `rss.xml` branches on `eq .Title .Site.Title`), and it must **not** gain `date`/`lastmod` (would add a `<lastmod>` for `/` in `sitemap.xml`), `description` (would override the site-wide `<meta name="description">`), `noindex` or `hidenav`.
- `layouts/404.html`, `layouts/_default/list.html`, `layouts/_default/sitemap.xml` — the rest of the default/list/taxonomy rendering.

## The raw-HTML rule

Goldmark `unsafe` is **off**, so raw HTML written directly in markdown content gets stripped. The workaround is the `rawhtml` shortcode (`layouts/shortcodes/rawhtml.html`, body is just `{{ .Inner }}`), already used in 19 content files. Use `{{< rawhtml >}}...{{< /rawhtml >}}` for raw HTML in new or edited content. **Do not enable `unsafe` globally** — it would change how all 55 existing content files render.

A `rawhtml` block may open a tag and a later block close it (`content/_index.md` does this to wrap markdown prose in `<section>`/`<div>`). Hugo does not `<p>`-wrap a standalone shortcode placeholder, so this is safe.

Two things Goldmark does to prose that raw HTML avoids, worth knowing before converting markup to markdown: headings gain auto-generated `id`s, and the typographer turns straight quotes into `&ldquo;`/`&rdquo;`.

## The MailerLite embed shortcode

`layouts/shortcodes/mlform.html` renders `<div class="ml-embedded" data-form="…"></div>`. Called bare (`{{< mlform >}}`) it uses the newsletter form `HwWIEu`; pass an id for any other form (`{{< mlform "U46g6b" >}}`). Used three times by `content/_index.md`.

That hardcoded `HwWIEu` default is the seam issue #6 replaces with a config param. The five other content files with hand-written `ml-embedded` divs (`consultoria.md`, `inperson.md`, `aitor.md`, `ceu-regalo.md`, `rquixote.md`) and `layouts/partials/subscribe.html` have not been migrated to the shortcode.

## Duplicated partials

`layouts/partials/header.html`, `post-header.html`, `correos-header.html`, and `venta-header.html` are near-identical copies (they differ only in minor things like comment blocks and script placement). `layouts/partials/footer.html`, `post-footer.html`, `correos-footer.html`, and `venta-footer.html` are currently byte-identical. Any change to shared header/footer markup must be applied to all four files in each group until they're collapsed.

> Note: issue #2 (this series) is expected to eventually collapse these into shared partials. Update this section once that lands.

## Multilingual conventions

- Spanish stays at `/`. English goes to `/en/`. `defaultContentLanguageInSubdir` stays `false`.
- English content files use the `.en.md` suffix pairing with the Spanish original, e.g. `content/about.en.md` pairs with `content/about.md`. No `.en.md` files exist yet.
- UI strings (nav labels, buttons, boilerplate) belong in `i18n/*.toml`. That directory doesn't exist yet — create it when the first English strings are needed.
- Page copy (actual article/page content) lives in content files, not `i18n/`.

## Known config oddities — do not "fix" these

These look like bugs but changing them changes live URLs or behavior on a site with real traffic. Verify actual rendered behavior before touching any of them.

- `config.toml:28` — `[[permalinks]]` is written as an array-of-tables, but Hugo expects `[permalinks]` (a plain table). Because of this, posts resolve to `/post/<slug>/`, not the configured `/:year/:month/:day/:slug/` — the permalink rule appears to be silently ignored.
- `config.toml:26` — `disableKinds` is nested under `[params]` instead of being a top-level key, so it likely isn't disabling taxonomy pages as intended.
- `config.toml:4` and `config.toml:8` — `canonifyurls = true` and `relativeUrls = true` are both set and pull in opposite directions. Don't assume either one's effect without checking rendered output.

## House rule

The site is live with inbound traffic and search rankings. **Never move or rename an existing URL without an explicit decision to do so.**
