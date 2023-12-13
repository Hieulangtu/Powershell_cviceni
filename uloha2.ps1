# Změňte barvu písma na žlutou a vypište informaci o execution policy
Write-Host "Execution Policy: $ExecutionContext.SessionState.LanguageMode" -ForegroundColor Yellow

# Změňte barvu písma na zelenou a vypište cestu k profilovému skriptu
Write-Host "Profile Path: $PROFILE" -ForegroundColor Green
