$infor_exe_policy = Get-ExecutionPolicy
# Změňte barvu písma na žlutou a vypište informaci o execution policy
Write-Host "Execution Policy: $infor_exe_policy" -ForegroundColor Yellow

# Změňte barvu písma na zelenou a vypište cestu k profilovému skriptu
Write-Host "Profile Path: $PROFILE" -ForegroundColor Green
