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
