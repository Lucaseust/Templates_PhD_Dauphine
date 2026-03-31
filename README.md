# Templates_PhD_Dauphine

Collection of LaTeX templates for Université Paris Dauphine - PSL.

This repository contains three distinct templates:

- a thesis manuscript template
- a Beamer presentation template
- a poster template

## Repository structure

```text
Templates_PhD_Dauphine/
|-- README.md
|-- GUIDE.md
|-- Dauphine Thesis Manuscript Template/
|   |-- ATTRIBUTION.md
|   |-- LICENSE
|   |-- main.tex
|   |-- chapter-ch1.tex
|   |-- chapter-ch2.tex
|   |-- chapter-ch3.tex
|   |-- chapter-ch4.tex
|   |-- psl-cover.sty
|   |-- assets/
|   |   |-- cover/
|   |   `-- preview/
|   |-- backmatter/
|   |-- bibliography/
|   |-- ch1/
|   |-- ch2/
|   |-- ch3/
|   |-- ch4/
|   |-- config/
|   `-- frontmatter/
|-- Dauphine Presentation Template/
|   |-- Template Dauphine-PSL.tex
|   |-- logo_dauphine_psl.png
|   `-- logo_dauphine_insigne.png
`-- Dauphine Poster Template/
    `-- Poster Template.tex
```

## Using the Thesis Manuscript Template

Folder: `Dauphine Thesis Manuscript Template/`

Main entry points:

- `main.tex` for the full manuscript
- `chapter-ch1.tex` to `chapter-ch4.tex` to compile individual chapters

Previews:

| Manuscript cover | Chapter preview |
| --- | --- |
| ![Manuscript cover preview](Dauphine%20Thesis%20Manuscript%20Template/assets/preview/manuscript-cover.png) | ![Standalone chapter preview](Dauphine%20Thesis%20Manuscript%20Template/assets/preview/chapter-preview.png) |

Build command (from `Dauphine Thesis Manuscript Template/`):

```text
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build main.tex
```

Build a single chapter:

```text
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build chapter-ch2.tex
```

Files to customize first:

1. `config/cover-metadata.tex`
2. `frontmatter/`
3. `ch1/` à `ch4/`
4. `bibliography/references.bib`

## Using the Presentation Template

Folder: `Dauphine Presentation Template/`

Main entry point:

- `Template Dauphine-PSL.tex`

Visual examples:

| Example 1 | Example 2 |
| --- | --- |
| ![Presentation example 1](Dauphine%20Presentation%20Template/exemple1.png) | ![Presentation example 2](Dauphine%20Presentation%20Template/exemple2.png) |

Build command (from `Dauphine Presentation Template/`):

```text
latexmk -pdf -interaction=nonstopmode -file-line-error "Template Dauphine-PSL.tex"
```

## Using the Poster Template

Folder: `Dauphine Poster Template/`

Main entry point:

- `Poster Template.tex`

Visual example:

![Poster example](Dauphine%20Poster%20Template/exemple%203.png)

Build command (from `Dauphine Poster Template/`):

```text
latexmk -pdf -interaction=nonstopmode -file-line-error "Poster Template.tex"
```

## Environment check (Windows)

```text
where latexmk
where xelatex
where biber
```

## Overleaf

Recommended workflow:

1. Create an empty Overleaf project.
2. Upload only the folder of the chosen template.
3. Set the correct main document.

Main documents:

- manuscript: `main.tex`
- presentation: `Template Dauphine-PSL.tex`
- poster: `Poster Template.tex`

## Documentation and attribution

- Full guide: `GUIDE.md`
- Manuscript attribution: `Dauphine Thesis Manuscript Template/ATTRIBUTION.md`
- Manuscript license: `Dauphine Thesis Manuscript Template/LICENSE`

The manuscript template includes a modified version of Pierre Guillou's PSL cover package. Copyright and license information remain in `Dauphine Thesis Manuscript Template/psl-cover.sty`.
