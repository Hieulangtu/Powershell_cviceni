#Vypište seznam nepoužitých účtů a seznam uzamčených účtů.
$users = Get-WmiObject -Class Win32_UserAccount
$notusedAcc = $users | Where-Object { $_.Disabled -eq $false -and $_.Lockout -eq $false -and $_.LastLogon -lt $date }
$blockedAcc = $users | Where-Object { $_.Disabled -eq $false -and $_.Lockout -eq $true }

Write-Host "Nepoužité účty:"
$notusedAcc | Select-Object Name
Write-Host "`nUzamčené účty:"
$blockedAcc | Select-Object Name

#7a và 7b dùng ở powershell cmdlet