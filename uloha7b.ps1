#Použijte vhodný cmdlet a poté totéž udělejte pomocí CIM rozhraní.

$users = Get-LocalUser
$notusedAcc = $users | Where-Object { $_.Enabled -eq $true -and $_.LastLogon -lt $date }
$blockedAcc = $users | Where-Object { $_.Enabled -eq $true -and $_.Lockout -eq $true }

Write-Host "Nepoužité účty:"
$notusedAcc | Select-Object Name
Write-Host "`nUzamčené účty:"
$blockedAcc | Select-Object Name

#7a và 7b dùng ở powershell cmdlet