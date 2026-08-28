param(
    [Parameter(Mandatory=$true)]
    [string]$Message
)

$ErrorActionPreference = "Stop"

$branch = (git branch --show-current).Trim()
if ([string]::IsNullOrWhiteSpace($branch)) {
    throw "Not inside a Git worktree."
}

if ($branch -in @("main", "master")) {
    throw "Refusing checkpoint on protected branch '$branch'."
}

$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    throw "No changes to checkpoint."
}

Write-Host "Running verification..."
& "$PSScriptRoot\verification.ps1"
if ($LASTEXITCODE -ne 0) {
    throw "Verification failed. No commit created."
}

git diff --check
if ($LASTEXITCODE -ne 0) {
    throw "git diff --check failed. No commit created."
}

git add -A
git diff --cached --check
if ($LASTEXITCODE -ne 0) {
    throw "Staged diff check failed. No commit created."
}

git commit -m $Message
if ($LASTEXITCODE -ne 0) {
    throw "Commit failed."
}

$hash = (git rev-parse --short HEAD).Trim()
Write-Host "CHECKPOINT CREATED: $hash"
Write-Host "Branch: $branch"
