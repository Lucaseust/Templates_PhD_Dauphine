# PSL Thesis Template

This folder is a shareable PSL thesis template. It keeps the PSL cover integration, a manuscript-style chapter structure, standalone chapter builds, and a bibliography workflow designed to work well with `biblatex`, `biber`, Zotero, and Better BibTeX.

## What this template gives you

- a full thesis entry point in `main.tex`
- standalone chapter entry points in `chapter-ch1.tex` to `chapter-ch4.tex`
- chapter folders that mirror a real manuscript workflow: one root chapter file plus section files
- boxed chapter-overview blocks at the beginning of each chapter
- chapter-level reference sections through `refsection`
- PSL cover support through `psl-cover.sty`
- PowerShell build scripts with stable output paths under `build/`

## Requirements

- a LaTeX distribution with `xelatex` and `biber`
- PowerShell for the provided build scripts

The recommended engine is `xelatex`. The template is configured for `biblatex` with `biber`, not for legacy BibTeX workflows.

## Repository structure

- `main.tex`: full manuscript entry point
- `chapter-ch1.tex` to `chapter-ch4.tex`: standalone chapter entry points
- `config/`: shared configuration
  - `preamble.tex`: packages, bibliography, numbering, layout helpers
  - `cover-metadata.tex`: title, author, jury, abstract, keywords
  - `chapter-standalone.tex`: wrapper used by standalone chapter entry points
- `frontmatter/`: dedication, acknowledgements, TOC, resume, introduction, acronyms
- `ch1/` to `ch4/`: chapter root files and section files
- `backmatter/`: conclusion
- `bibliography/`: bibliography database
- `assets/cover/`: cover images and institute logo
- `scripts/`: build helpers
- `build/`: generated PDFs and LaTeX cache

## Quick start

1. Update [`config/cover-metadata.tex`](config/cover-metadata.tex) with your title, name, jury, abstracts, and keywords.
2. Replace the placeholder frontmatter files under [`frontmatter/`](frontmatter/).
3. Replace the placeholder chapter text under [`ch1/`](ch1/), [`ch2/`](ch2/), [`ch3/`](ch3/), and [`ch4/`](ch4/).
4. Connect or replace [`bibliography/references.bib`](bibliography/references.bib).
5. Build the manuscript.

## Build commands

Full manuscript:

```powershell
.\scripts\build-manuscript.ps1
```

All standalone chapters:

```powershell
.\scripts\build-chapters.ps1
```

One specific entry point:

```powershell
.\scripts\build-latex.ps1 -Entry .\main.tex -Engine xelatex
.\scripts\build-latex.ps1 -Entry .\chapter-ch2.tex -Engine xelatex
```

Canonical outputs:

- `build/main.pdf`
- `build/chapter-ch1.pdf`
- `build/chapter-ch2.pdf`
- `build/chapter-ch3.pdf`
- `build/chapter-ch4.pdf`

## Chapter logic

Each chapter is intentionally split in two layers.

- The root chapter file such as [`ch1/ch1.tex`](ch1/ch1.tex) contains:
  - `\chapter{...}`
  - `\chaptermark{...}`
  - a boxed `\objectif{...}` overview that can act as a chapter abstract or reader roadmap
  - the `refsection` block and the chapter-level bibliography
- The section files such as [`ch1/ch1_1.tex`](ch1/ch1_1.tex) contain the actual body text.

This is close to the structure of the original manuscript and makes it easier to:

- circulate one chapter as a standalone PDF
- keep chapter-level references isolated
- revise long chapters without turning one file into a monolith

Because each chapter is wrapped in its own `refsection`, a standalone chapter PDF only prints the references cited inside that chapter.

## Bibliography workflow

This template uses `biblatex` with `biber`. That is the recommended setup for a modern thesis workflow, especially if you work from Zotero.

### Recommended Zotero workflow

The smoothest setup is:

1. Keep your bibliography in Zotero.
2. Install Better BibTeX in Zotero.
3. Auto-export a collection or your thesis library to [`bibliography/references.bib`](bibliography/references.bib).
4. Keep that export updated automatically.
5. Cite only through stable citation keys in LaTeX.

### Good practices with Better BibTeX

- Choose a stable citation-key pattern early and keep it fixed for the project.
- Avoid renaming citation keys once the manuscript is under active writing, unless you are ready to update all citations.
- Treat `bibliography/references.bib` as a generated file if it comes from Zotero auto-export.
- Do not manually clean, reorder, or "improve" an auto-exported `.bib` by hand; make the correction in Zotero instead.
- If a reference is wrong, fix the Zotero item, not the generated `.bib`.
- If you use Zotero collections, export only the collection relevant to the thesis rather than your whole library.

### Good practices in LaTeX

- Use `\textcite{key}` when the author belongs to the sentence.
- Use `\parencite{key}` when the citation belongs in parentheses.
- Use one citation key style consistently across the thesis.
- Build with `biber`, not `bibtex`.

### If you need local manual entries

If you want a few entries that should not live in Zotero, the clean approach is to add a second local bibliography file rather than editing the Zotero export.

Example:

```tex
\addbibresource{bibliography/references.bib}
\addbibresource{bibliography/local.bib}
```

If you do this, keep `references.bib` generated and keep `local.bib` hand-maintained.

## Writing and repository practices

- Keep chapter root files thin. They should manage chapter structure, not hold all the prose.
- Put substantial content in section files.
- Keep file names simple and predictable.
- Avoid spaces in `.tex`, image, and bibliography file names.
- Keep generated artifacts under `build/`, not mixed with source files.
- Commit source files first; generated PDFs are optional and should not drive the workflow.
- Keep cover assets under `assets/cover/` so the package works with relative paths.
- If you change bibliography structure, update [`config/preamble.tex`](config/preamble.tex) explicitly rather than scattering `\addbibresource` calls through the manuscript.

## Attribution and publishing

This template includes a modified copy of Pierre Guillou's PSL thesis cover package.

- official project page: <https://pierre.guillou.net/psl-cover/2018/>
- attribution notes: [`ATTRIBUTION.md`](ATTRIBUTION.md)

The original copyright notice is preserved in [`psl-cover.sty`](psl-cover.sty).

If you publish this template as a GitHub repository, good practice is to:

- keep the attribution intact
- add a proper `LICENSE` file compatible with the included cover package
- describe clearly what is original to this template and what comes from the upstream PSL cover project
