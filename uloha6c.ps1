#Získání instance disku s názvem "C:"
$diskC = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'"
#Vypsání aktuálního názvu disku C:
Write-Output "Aktuální název disku C: $($diskC.VolumeName)"
#Případná změna názvu disku na "System"
$newVolumeName = "System"
$diskC | Set-CimInstance -Property @{ VolumeName = $newVolumeName }