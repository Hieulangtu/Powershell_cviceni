# c. Vytvořte skript, který změní systémový čas počítače např. podle worldtimeapi.org. Pokud ho nespustíte jako administrátor, 
# tak se sám restartuje, aby mohl změnu času provést.
$timeData = Invoke-RestMethod -Uri "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Prague"

$time = $timeData.dateTime

Write-Output $time

# kontrole PowerShell je Administrator nebo ne
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # pokud ne Administrator, restart PowerShell s Administrator
    Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    # konci 
    Exit
}

# setchange
Set-Date -Date (Get-Date $time)
