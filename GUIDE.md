# Guide To Using This Repository

This file is the main onboarding guide for Templates_PhD_Dauphine. It explains how to choose a template, what to edit first, how to build locally, and how to use the templates on Overleaf or macOS.

## 1. What this repository contains

This repository provides three separate LaTeX templates for Université Paris Dauphine - PSL:

- `Dauphine Thesis Manuscript Template/` for thesis manuscripts
- `Dauphine Presentation Template/` for Beamer slides
- `Dauphine Poster Template/` for posters

The project is designed for local editing in VS Code (or similar editors), with Git and `latexmk` as the default workflow.

## 2. Recommended local setup

Recommended tools:

- VS Code, VSCodium, or Cursor
- LaTeX Workshop (or an equivalent LaTeX extension)
- Git
- a TeX distribution that provides `latexmk`, `xelatex`, `pdflatex`, and `biber`

The workflow is Windows-first in examples, but the templates are portable to macOS and Overleaf.

## 3. How to get the repository

You can:

1. Use the repository as a template on GitHub.
2. Download ZIP from GitHub and extract locally.
3. Clone with Git:

```text
git clone https://github.com/Lucaseust/Templates_PhD_Dauphine.git
cd Templates_PhD_Dauphine
```

## 4. Environment checks

On Windows:

```text
where latexmk
where xelatex
where pdflatex
where biber
```

On macOS:

```text
which latexmk
which xelatex
which pdflatex
which biber
```

## 5. Thesis template workflow

Folder:

- `Dauphine Thesis Manuscript Template/`

Main entry points:

- `main.tex` (full manuscript)
- `chapter-ch1.tex` to `chapter-ch4.tex` (standalone chapter builds)

### What to edit first

1. `Dauphine Thesis Manuscript Template/config/cover-metadata.tex`
2. `Dauphine Thesis Manuscript Template/frontmatter/`
3. `Dauphine Thesis Manuscript Template/ch1/` to `Dauphine Thesis Manuscript Template/ch4/`
4. `Dauphine Thesis Manuscript Template/bibliography/references.bib`

### Build commands

Run from `Dauphine Thesis Manuscript Template/`.

Full manuscript:

```text
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build main.tex
```

Standalone chapter:

```text
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build chapter-ch2.tex
```

Expected outputs:

- `build/main.pdf`
- `build/chapter-ch1.pdf`
- `build/chapter-ch2.pdf`
- `build/chapter-ch3.pdf`
- `build/chapter-ch4.pdf`

Generated files should stay in `build/` and should not be committed.

### Bibliography notes

The manuscript template uses `biblatex` + `biber`.

If using Zotero + Better BibTeX:

1. Keep references in Zotero.
2. Auto-export to `Dauphine Thesis Manuscript Template/bibliography/references.bib`.
3. Use stable citation keys in `.tex` files.

## 6. Presentation template workflow

Folder:

- `Dauphine Presentation Template/`

Main entry point:

- `Template Dauphine-PSL.tex`

Build from that folder:

```text
latexmk -pdf -interaction=nonstopmode -file-line-error "Template Dauphine-PSL.tex"
```

## 7. Poster template workflow

Folder:

- `Dauphine Poster Template/`

Main entry point:

- `Poster Template.tex`

Build from that folder:

```text
latexmk -pdf -interaction=nonstopmode -file-line-error "Poster Template.tex"
```

If your local TeX installation misses legacy classes or packages (for example `a0poster.cls`), install them with your TeX package manager before building.

## 8. VS Code workflow

Recommended workflow:

1. Open the repository root in VS Code.
2. Use LaTeX Workshop for build/clean commands.
3. Open and build the relevant root file for your target:
	`main.tex`, `chapter-chX.tex`, `Template Dauphine-PSL.tex`, or `Poster Template.tex`.
4. Keep source files under Git; avoid committing build artifacts.

## 9. Overleaf workflow

For each template:

1. Create an empty Overleaf project.
2. Upload only the chosen template folder.
3. Set the appropriate main file.
4. Select compiler (`XeLaTeX` for manuscript; `pdfLaTeX` is generally fine for the other two unless you customize fonts heavily).

Main files:

- manuscript: `main.tex`
- presentation: `Template Dauphine-PSL.tex`
- poster: `Poster Template.tex`

## 10. macOS adaptation

The templates are portable on macOS.

Recommended path:

1. Install MacTeX (or equivalent) with `latexmk`, `xelatex`, `pdflatex`, and `biber`.
2. Build with the same commands as in this guide.
3. Keep folder structure unchanged.

## 11. Good practices

- Keep chapter root files structural and concise.
- Put substantive thesis content in section files.
- Keep bibliography management centralized.
- Commit source files and assets used by README.
- Ignore generated outputs.
- If you change bibliography resources, update `Dauphine Thesis Manuscript Template/config/preamble.tex` explicitly.

## 12. Important files at a glance

Repository tree:

```text
Templates_PhD_Dauphine/
|-- README.md
|-- GUIDE.md
|-- Dauphine Thesis Manuscript Template/
|-- Dauphine Presentation Template/
`-- Dauphine Poster Template/
```

Key manuscript files:

- `Dauphine Thesis Manuscript Template/main.tex`
- `Dauphine Thesis Manuscript Template/chapter-ch1.tex` to `chapter-ch4.tex`
- `Dauphine Thesis Manuscript Template/config/preamble.tex`
- `Dauphine Thesis Manuscript Template/config/cover-metadata.tex`
- `Dauphine Thesis Manuscript Template/bibliography/references.bib`

## 13. Attribution and license

The thesis manuscript template includes a modified copy of Pierre Guillou's PSL thesis cover package.

See:

- `Dauphine Thesis Manuscript Template/ATTRIBUTION.md`
- `Dauphine Thesis Manuscript Template/LICENSE`
- `Dauphine Thesis Manuscript Template/psl-cover.sty`

If you redistribute the repository, keep these notices with your copy.
