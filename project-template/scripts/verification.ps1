$ErrorActionPreference = "Stop"

# EDIT THESE COMMANDS FOR YOUR PROJECT.
$commands = @{
    Format    = ""
    Lint      = ""
    Typecheck = ""
    Test      = ""
}

function Invoke-Check([string]$Name) {
    $cmd = $commands[$Name]
    if ([string]::IsNullOrWhiteSpace($cmd)) {
        Write-Host "SKIP $Name (not configured)"
        return
    }
    Write-Host "RUN $Name : $cmd"
    Invoke-Expression $cmd
    if ($LASTEXITCODE -ne 0) {
        throw "$Name failed with exit code $LASTEXITCODE"
    }
}

Invoke-Check "Format"
Invoke-Check "Lint"
Invoke-Check "Typecheck"
Invoke-Check "Test"

Write-Host "VERIFICATION PASSED"
