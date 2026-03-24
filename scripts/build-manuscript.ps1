<#
.SYNOPSIS
  Build the full manuscript PDF.

.PARAMETER Engine
  LaTeX engine to use: xelatex (default) or pdflatex.

.PARAMETER Force
  Delete the manuscript cache folder before building (clean build).

.EXAMPLE
  .\scripts\build-manuscript.ps1
  .\scripts\build-manuscript.ps1 -Engine pdflatex
  .\scripts\build-manuscript.ps1 -Force
#>
[CmdletBinding()]
param(
    [ValidateSet('xelatex','pdflatex')]
    [string]$Engine = 'xelatex',
    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path $PSScriptRoot
$buildScript = Join-Path $PSScriptRoot 'build-latex.ps1'

& $buildScript -Entry (Join-Path $repoRoot 'main.tex') -Engine $Engine -Force:$Force
