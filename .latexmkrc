# Project-wide latexmk configuration
# Engine-specific output directories are set via -outdir on the CLI;
# this file handles common optimisations only.

# Use biber for bibliography (matches biblatex backend=biber in preamble)
$bibtex_use = 2;  # run biber when needed

# Run enough passes to resolve all cross-references
$max_repeat = 5;

# File extensions to clean with latexmk -c / -C
$clean_ext = 'aux bbl bcf blg fdb_latexmk fls log maf mtc mtc0 mtc1 mtc2 mtc3 mtc4 mtc5 mtc6 mtc7 mtc8 mtc9 nav out run.xml snm synctex.gz toc xdv';

# Silence some non-critical warnings during nonstopmode builds
$silence_logfile_warnings = 1;
