param(
    [Parameter(Mandatory=$true)]
    [string]$Name
)

$ErrorActionPreference = "Stop"

$current = (git branch --show-current).Trim()
if ($current -notin @("main", "master")) {
    throw "Already on '$current'. Refusing nested branch creation."
}

if (git status --porcelain) {
    throw "Working tree is dirty."
}

$branch = "feature/$Name"
git switch -c $branch
if ($LASTEXITCODE -ne 0) {
    throw "Unable to create branch."
}

Write-Host "Created: $branch"
