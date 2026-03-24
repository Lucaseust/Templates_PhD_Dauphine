# Guide To Using This Template

This file is the main onboarding guide for the repository. It explains how to download the template, what to edit first, how to build it, how to use it in VS Code, and how to adapt it to Overleaf or macOS.

## 1. What this template is

This repository is a reusable PSL thesis template for LaTeX. It is structured for long-form writing and ongoing revision, not only for a single final PDF build.

It is primarily designed for a local Windows workflow in VS Code or a similar editor, but it can also be used on Overleaf or adapted to macOS.

The template includes:

- a complete manuscript entry point in `main.tex`
- standalone chapter entry points in `chapter-ch1.tex` to `chapter-ch4.tex`
- chapter folders with one root file plus section files
- chapter-level reference sections
- a PSL cover setup
- a workflow based on direct editor builds or `latexmk` commands

It is a good fit if you want:

- a thesis repository that stays readable as it grows
- chapter-by-chapter editing and review
- a bibliography workflow compatible with Zotero and Better BibTeX
- one project that can produce both the whole manuscript and individual chapter PDFs

## 2. Recommended editor and workflow

The recommended setup for this template is:

- local files on your machine
- VS Code, VSCodium, or Cursor as the editor
- a LaTeX extension such as LaTeX Workshop
- Git for version control
- `latexmk` for builds

This repository is Windows-first:

- the quick-start examples target a Windows terminal
- the default local workflow assumes a Windows machine with a local TeX installation
- no executable helper script from the repository is required

This workflow is optimized for:

- clean navigation across many files
- local Git usage
- local Zotero or Better BibTeX integration
- easy switching between full-manuscript and standalone-chapter builds

## 3. How to download it

After the repository is published on GitHub, people can get it in one of these ways.

### Option A: Use it as a GitHub template

This is the best choice if you want your own repository immediately.

1. Open the repository page on GitHub.
2. Click `Use this template`.
3. Create a new repository under your own account.
4. Clone your new repository locally.

### Option B: Download the ZIP

This is the simplest choice if you just want the files first.

1. Open the repository page on GitHub.
2. Click `Code`.
3. Click `Download ZIP`.
4. Extract the archive on your computer.

If you later want version control, open the extracted folder and run:

```text
git init -b main
```

### Option C: Clone the repository

This is the best choice if you are comfortable with Git already.

```text
git clone https://github.com/YOUR-ACCOUNT/YOUR-REPO.git
cd YOUR-REPO
```

If your goal is to work on Overleaf rather than locally, you can also download the ZIP, extract it, then upload the source files into a blank Overleaf project.

## 4. What you need before building

Install:

- a LaTeX distribution that includes `latexmk`
- `xelatex` or `pdflatex`
- `biber`
- a terminal on your system

The template is set up for `biblatex` with `biber`. It is not configured for a legacy BibTeX workflow.

The recommended engine is `xelatex`.

### Verify your tools on Windows

```text
where latexmk
where xelatex
where biber
```

### Verify your tools on macOS

```text
which latexmk
which xelatex
which biber
```

## 5. What to edit first

The fastest way to personalize the template is to work through these files in order.

### Cover metadata

Update [`config/cover-metadata.tex`](config/cover-metadata.tex):

- thesis title
- author name
- date
- doctoral school
- specialty
- jury members
- abstracts
- keywords

### Front matter

Replace the placeholder files in [`frontmatter/`](frontmatter/), especially:

- dedication
- acknowledgements
- introduction
- resume
- acronyms

### Chapters

Replace the placeholder chapter content in:

- [`ch1/`](ch1/)
- [`ch2/`](ch2/)
- [`ch3/`](ch3/)
- [`ch4/`](ch4/)

Each chapter folder is split into:

- one root chapter file that controls the chapter structure
- one or more section files that hold the actual prose

This makes it easier to revise long chapters without turning each one into a single large file.

### Bibliography

Replace or connect [`bibliography/references.bib`](bibliography/references.bib).

If you use Zotero, the smoothest workflow is:

1. Keep your references in Zotero.
2. Install Better BibTeX.
3. Auto-export your thesis collection to `bibliography/references.bib`.
4. Cite with stable citation keys in LaTeX.

If you need a few hand-written entries, keep them in a separate file such as `bibliography/local.bib` instead of editing an auto-exported Zotero file.

## 6. How the chapter structure works

Each chapter is intentionally split in two layers.

The root file, such as [`ch1/ch1.tex`](ch1/ch1.tex), usually contains:

- `\chapter{...}`
- `\chaptermark{...}`
- the chapter overview block
- the `refsection` wrapper
- the chapter bibliography

The section files, such as [`ch1/ch1_1.tex`](ch1/ch1_1.tex), contain the body text.

This setup is useful because it makes it easier to:

- circulate one chapter as a standalone PDF
- isolate chapter references
- keep a large thesis manageable over time

## 7. How to build the project

From the repository root, use either VS Code or direct `latexmk` commands.

### Full manuscript

```text
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build main.tex
```

### Standalone chapter

```text
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build chapter-ch2.tex
```

Expected output files:

- `build/main.pdf`
- `build/chapter-ch1.pdf`
- `build/chapter-ch2.pdf`
- `build/chapter-ch3.pdf`
- `build/chapter-ch4.pdf`

Generated files stay under `build/`, which is ignored by Git.

## 8. How to use it in VS Code

The template is intended to work well with a local editor workflow.

Recommended setup:

- open the repository folder in VS Code
- install LaTeX Workshop or a similar extension
- keep `main.tex` as the root document for the full thesis
- switch to `chapter-ch1.tex`, `chapter-ch2.tex`, and so on when you want a standalone chapter build
- use the extension build button or a terminal command

This gives you the convenience of an editor workflow without needing to execute downloaded helper scripts from the repository.

## 9. Overleaf compatibility

The template is also compatible with Overleaf, but the workflow is a little different.

On Overleaf, you only need the source files.

The practical Overleaf workflow is:

1. Create a blank Overleaf project.
2. Upload the repository contents except `build/` and `.git/`.
3. Keep the chapter folders, `config/`, `frontmatter/`, `backmatter/`, `bibliography/`, and `assets/`.
4. Set `main.tex` as the main document.
5. Select `XeLaTeX` in the Overleaf compiler settings.
6. Recompile.

If you want to compile a standalone chapter on Overleaf, switch the main document from `main.tex` to one of:

- `chapter-ch1.tex`
- `chapter-ch2.tex`
- `chapter-ch3.tex`
- `chapter-ch4.tex`

## 10. Adapting the template to macOS

The LaTeX project itself is portable.

To use the template on macOS:

1. Install MacTeX or another distribution that provides `latexmk`, `xelatex`, and `biber`.
2. Open the folder in VS Code, VSCodium, or another editor.
3. Run direct `latexmk` commands from Terminal.
4. Keep the same source structure, bibliography files, and assets.

Typical macOS commands:

```text
which latexmk
which xelatex
which biber
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build main.tex
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build chapter-ch2.tex
```

If you want a one-command workflow on macOS too, create local shell aliases or `.sh` wrappers for yourself. The repository itself does not require any executable helper file.

## 11. Recommended way to work with the repository

Good habits for this template:

- keep chapter root files thin and structural
- put real prose in section files
- avoid spaces in file names
- keep bibliography management centralized
- commit source files, not build artifacts
- treat generated `.bib` files as generated if they come from Zotero

If you change bibliography resources, update [`config/preamble.tex`](config/preamble.tex) explicitly rather than adding bibliography commands in many places.

## 12. How to publish your own copy

If you adapt this template and want to publish your own version on GitHub:

1. Create a new repository under your account.
2. Push your local folder to that repository.
3. Keep the attribution information in [`ATTRIBUTION.md`](ATTRIBUTION.md).
4. Keep the licensing information visible.
5. Make clear what comes from the upstream PSL cover project and what comes from your own template changes.

If you want other people to reuse your version easily, enable the repository as a template or explain clearly whether they should clone it or download it as a ZIP.

## 13. Important files at a glance

Repository tree:

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

- `main.tex`: full thesis entry point
- `chapter-ch1.tex` to `chapter-ch4.tex`: standalone chapter entry points
- `config/preamble.tex`: shared packages and bibliography configuration
- `config/cover-metadata.tex`: thesis metadata
- `config/chapter-standalone.tex`: standalone chapter wrapper
- `bibliography/`: bibliography files
- `assets/cover/`: cover assets
- `build/`: generated outputs

## 14. Attribution and license

This template includes a modified copy of Pierre Guillou's PSL thesis cover package.

See:

- [`ATTRIBUTION.md`](ATTRIBUTION.md)
- [`LICENSE`](LICENSE)
- [`psl-cover.sty`](psl-cover.sty)

If you redistribute the repository, keep those notices with it.
