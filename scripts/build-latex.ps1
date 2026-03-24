[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Entry,
    [ValidateSet('xelatex','pdflatex')]
    [string]$Engine = 'xelatex',
    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Resolve-DocumentPath {
    param(
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$RepoRoot
    )

    $candidatePaths = @()

    if ([System.IO.Path]::IsPathRooted($Path)) {
        $candidatePaths += $Path
    } else {
        $candidatePaths += (Join-Path (Get-Location) $Path)
        $candidatePaths += (Join-Path $RepoRoot $Path)
    }

    foreach ($candidate in $candidatePaths) {
        if (Test-Path $candidate) {
            return (Resolve-Path $candidate).Path
        }
    }

    throw "Entry point not found: $Path"
}

function Get-RepoRelativePath {
    param(
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$RepoRoot
    )

    $repoUri = [System.Uri]::new(($RepoRoot.TrimEnd('\') + '\'))
    $pathUri = [System.Uri]::new($Path)
    return [System.Uri]::UnescapeDataString(
        $repoUri.MakeRelativeUri($pathUri).ToString()
    ).Replace('/', '\')
}

function New-BuildLayout {
    param(
        [Parameter(Mandatory)]
        [string]$RepoRoot,
        [Parameter(Mandatory)]
        [string]$EntryPath,
        [Parameter(Mandatory)]
        [string]$RelativePath,
        [Parameter(Mandatory)]
        [string]$Engine
    )

    $entryDir = Split-Path $EntryPath -Parent
    $docBase = [System.IO.Path]::GetFileNameWithoutExtension($EntryPath)

    $layout = [ordered]@{
        StablePdf = ''
        CacheDir  = ''
        JobName   = ''
        Label     = $docBase
    }

    if ($RelativePath -ieq 'main.tex') {
        $layout.Label = 'manuscript'
        $layout.StablePdf = Join-Path $RepoRoot 'build\\main.pdf'
        $layout.CacheDir = Join-Path $RepoRoot "build\\.cache\\manuscript\\$Engine"
        $layout.JobName = "manuscript-$Engine"
        return $layout
    }

    if ($RelativePath -match '^chapter-ch[1-4]\.tex$') {
        $layout.Label = "standalone $docBase"
        $layout.StablePdf = Join-Path $RepoRoot "build\\$docBase.pdf"
        $layout.CacheDir = Join-Path $RepoRoot "build\\.cache\\chapters\\$Engine"
        $layout.JobName = "$docBase-$Engine"
        return $layout
    }

    if (($RelativePath -notmatch '\\') -and ($RelativePath -match '\.tex$')) {
        $layout.Label = "standalone doc $docBase"
        $layout.StablePdf = Join-Path $RepoRoot "build\\$docBase.pdf"
        $layout.CacheDir = Join-Path $RepoRoot "build\\.cache\\standalone\\$Engine"
        $layout.JobName = "$docBase-$Engine"
        return $layout
    }

    $layout.StablePdf = Join-Path $entryDir "build\\$docBase.pdf"
    $layout.CacheDir = Join-Path $entryDir "build\\$Engine"
    $layout.JobName = "$docBase-$Engine"
    return $layout
}

$repoRoot = Split-Path $PSScriptRoot
$entryPath = Resolve-DocumentPath -Path $Entry -RepoRoot $repoRoot
$relativePath = Get-RepoRelativePath -Path $entryPath -RepoRoot $repoRoot
$entryDir = Split-Path $entryPath -Parent
$entryName = Split-Path $entryPath -Leaf
$layout = New-BuildLayout -RepoRoot $repoRoot -EntryPath $entryPath -RelativePath $relativePath -Engine $Engine

if ($Force -and (Test-Path $layout.CacheDir)) {
    Write-Host "[build] Cleaning $($layout.CacheDir) ..." -ForegroundColor Yellow
    Remove-Item $layout.CacheDir -Recurse -Force
}

New-Item -ItemType Directory -Path $layout.CacheDir -Force | Out-Null
New-Item -ItemType Directory -Path (Split-Path $layout.StablePdf -Parent) -Force | Out-Null

$latexmkArgs = @(
    if ($Engine -eq 'xelatex') { '-xelatex' } else { '-pdf' }
    '-synctex=1'
    '-interaction=nonstopmode'
    '-file-line-error'
    "-outdir=$($layout.CacheDir)"
    "-jobname=$($layout.JobName)"
    $entryName
)

Write-Host "[build] Building $($layout.Label) with $Engine" -ForegroundColor Cyan
Write-Host "[build] Source : $relativePath" -ForegroundColor DarkGray
Write-Host "[build] Cache  : $($layout.CacheDir)" -ForegroundColor DarkGray
Write-Host "[build] Output : $($layout.StablePdf)" -ForegroundColor DarkGray

Push-Location $entryDir
try {
    & latexmk @latexmkArgs
    if ($LASTEXITCODE -ne 0) {
        throw "latexmk failed with exit code $LASTEXITCODE"
    }
} finally {
    Pop-Location
}

$cachePdf = Join-Path $layout.CacheDir "$($layout.JobName).pdf"
if (-not (Test-Path $cachePdf)) {
    throw "Expected PDF not found after build: $cachePdf"
}

Copy-Item $cachePdf $layout.StablePdf -Force

Write-Host "[build] Updated $($layout.StablePdf)" -ForegroundColor Green
