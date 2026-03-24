<#
.SYNOPSIS
  Build standalone chapter PDFs.

.PARAMETER Chapter
  Specific chapter to build: ch1, ch2, ch3, or ch4. Omit to build all.

.PARAMETER Engine
  LaTeX engine to use: xelatex (default) or pdflatex.

.PARAMETER Force
  Delete the shared chapter cache folder before rebuilding.

.EXAMPLE
  .\scripts\build-chapters.ps1
  .\scripts\build-chapters.ps1 -Chapter ch3
  .\scripts\build-chapters.ps1 -Chapter ch4 -Engine pdflatex
#>
[CmdletBinding()]
param(
    [ValidateSet('ch1','ch2','ch3','ch4')]
    [string]$Chapter,
    [ValidateSet('xelatex','pdflatex')]
    [string]$Engine = 'xelatex',
    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path $PSScriptRoot
$buildScript = Join-Path $PSScriptRoot 'build-latex.ps1'

$chapters = if ($Chapter) { @($Chapter) } else { @('ch1','ch2','ch3','ch4') }

if ($Force) {
    $chapterCacheDir = Join-Path $repoRoot "build\.cache\chapters\$Engine"
    if (Test-Path $chapterCacheDir) {
        Write-Host "[build] Cleaning $chapterCacheDir ..." -ForegroundColor Yellow
        Remove-Item $chapterCacheDir -Recurse -Force
    }
}

foreach ($ch in $chapters) {
    $entry  = "chapter-$ch.tex"

    if (-not (Test-Path (Join-Path $repoRoot $entry))) {
        Write-Warning "Entry point $entry not found, skipping."
        continue
    }

    & $buildScript -Entry (Join-Path $repoRoot $entry) -Engine $Engine
}
