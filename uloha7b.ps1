# Seznam nepoužitých účtů
$unusedAccounts = Get-CimInstance -ClassName Win32_UserAccount | Where-Object { $_.LastLogon -eq $null  }

# Seznam uzamčených účtů
$lockedAccounts = Get-CimInstance -ClassName Win32_UserAccount | Where-Object { $_.Disabled -eq $true }

# Výpis seznamu nepoužitých účtů
Write-Host "Nepoužité účty:"
$unusedAccounts | Format-Table Name

# Výpis seznamu uzamčených účtů
Write-Host "Uzamčené účty:"
$lockedAccounts | Format-Table Name, Disabled



