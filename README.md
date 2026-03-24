# PSL Thesis Template

A reusable and shareable PSL thesis template for LaTeX. It includes PSL cover support, a chapter-based writing structure, standalone chapter entry points, and a bibliography workflow that fits well with `biblatex`, `biber`, Zotero, and Better BibTeX.

This template is primarily designed for a local Windows workflow in VS Code, VSCodium, or Cursor. It can also be used on macOS and Overleaf. The repository does not rely on downloaded executable helper scripts.

## Preview

These screenshots come from the current sample render included in the repository.

| Manuscript cover | Standalone chapter |
| --- | --- |
| ![Rendered manuscript cover](assets/preview/manuscript-cover.png) | ![Rendered standalone chapter preview](assets/preview/chapter-preview.png) |

## Why this template exists

This repository is meant for people who want to start from a practical thesis skeleton instead of assembling one from scratch. It already includes:

- a full manuscript entry point in `main.tex`
- standalone chapter entry points in `chapter-ch1.tex` to `chapter-ch4.tex`
- a chapter-per-folder structure with separate section files
- chapter-level bibliographies through `refsection`
- PSL cover integration through `psl-cover.sty`
- a workflow based on direct editor builds or `latexmk` commands

## Local workflow

The intended workflow is local editing in VS Code, VSCodium, or Cursor with a LaTeX extension such as LaTeX Workshop.

This repository is Windows-first:

- the examples below use a Windows terminal
- the local setup assumes a Windows machine with a local TeX distribution
- no executable script from the repository is required

That workflow is the best fit if you want:

- version control with Git
- Zotero or Better BibTeX integration
- builds through VS Code or direct `latexmk` commands
- easier file-by-file editing across chapters and front matter

## Quick start

1. Get a copy of the repository.
2. Install a LaTeX distribution with `latexmk`, `xelatex`, and `biber`.
3. Update [`config/cover-metadata.tex`](config/cover-metadata.tex).
4. Replace the placeholder text in [`frontmatter/`](frontmatter/) and [`ch1/`](ch1/) to [`ch4/`](ch4/).
5. Replace or connect [`bibliography/references.bib`](bibliography/references.bib).
6. Check your setup in a Windows terminal:

```text
where latexmk
where xelatex
where biber
```

7. Build the manuscript:

```text
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build main.tex
```

## Overleaf workflow

This template can also be used on Overleaf.

The simplest path is:

1. Create a blank Overleaf project.
2. Upload all source files and folders except `build/` and `.git/`.
3. Set `main.tex` as the main document.
4. Select `XeLaTeX` as the compiler in the Overleaf menu.
5. Recompile the project.

If you want to compile one chapter as a standalone document on Overleaf, change the main document from `main.tex` to `chapter-ch1.tex`, `chapter-ch2.tex`, and so on.

## macOS adaptation

The LaTeX sources themselves are portable.

On macOS, use the repository with:

- VS Code, VSCodium, or another editor
- MacTeX or another TeX distribution that provides `latexmk`, `xelatex`, and `biber`
- direct terminal commands instead of repository helper scripts

Typical macOS commands:

```text
which latexmk
which xelatex
which biber
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build main.tex
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build chapter-ch2.tex
```

## How to get this template

Once this repository is on GitHub, people can use it in three common ways:

- Click `Use this template` to create a new repository from it.
- Click `Code` then `Download ZIP` for a one-time local copy.
- Clone it with Git:

```text
git clone https://github.com/YOUR-ACCOUNT/YOUR-REPO.git
```

If someone downloads the ZIP version, they can still initialize Git later in the extracted folder.

## Build commands

Use VS Code or run `latexmk` directly.

Check your setup on Windows:

```text
where latexmk
where xelatex
where biber
```

Build the full manuscript:

```text
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build main.tex
```

Build a standalone chapter:

```text
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build chapter-ch2.tex
```

Canonical outputs:

- `build/main.pdf`
- `build/chapter-ch1.pdf`
- `build/chapter-ch2.pdf`
- `build/chapter-ch3.pdf`
- `build/chapter-ch4.pdf`

Generated files under `build/` are ignored by Git by default.

## Repository layout

Quick folder view:

```text
psl-thesis-template/
|-- main.tex
|-- chapter-ch1.tex
|-- chapter-ch2.tex
|-- chapter-ch3.tex
|-- chapter-ch4.tex
|-- README.md
|-- GUIDE.md
|-- LICENSE
|-- ATTRIBUTION.md
|-- config/
|-- frontmatter/
|-- ch1/
|-- ch2/
|-- ch3/
|-- ch4/
|-- backmatter/
|-- bibliography/
|-- assets/
|   `-- cover/
`-- build/
```

- `main.tex`: full manuscript entry point
- `chapter-ch1.tex` to `chapter-ch4.tex`: standalone chapter entry points
- `config/`: shared preamble, cover metadata, and standalone wrappers
- `frontmatter/`: dedication, acknowledgements, TOC, resume, introduction, acronyms
- `ch1/` to `ch4/`: chapter root files and section files
- `backmatter/`: conclusion
- `bibliography/`: bibliography database files
- `assets/cover/`: cover images and institute logo
- `build/`: generated PDFs and LaTeX cache

The recommended local toolchain expects `latexmk`, `biber`, and a LaTeX engine such as `xelatex`.

## Documentation

- Full usage guide: [`GUIDE.md`](GUIDE.md)
- Attribution notes: [`ATTRIBUTION.md`](ATTRIBUTION.md)
- License notice: [`LICENSE`](LICENSE)

## Attribution and publishing

This template includes a modified copy of Pierre Guillou's PSL thesis cover package. The original copyright and licensing notice remains in [`psl-cover.sty`](psl-cover.sty).

If you republish or adapt this repository:

- keep the attribution intact
- keep the license information visible
- make clear which parts come from the upstream PSL cover project and which parts are specific to this template
