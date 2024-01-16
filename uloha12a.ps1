#Vytvořte skript, který oznámí, že byl spuštěn buď bez administrátorských práv, nebo s nimi. Pokud byl spuštěn bez administrátorských práv, tak se restartuje tak, aby administrátorská práva měl.
$adminRights = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if ($adminRights) {
    Write-Host "Skript byl spusten s administratorskymi pravy."
} else {
    Write-Host "Skript byl spusten bez administratorskych prav."
    $scriptPath = $MyInvocation.MyCommand.Path
    #Restartuje skript s administrátorskými právy
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -NoExit -Command `& '$scriptPath'" -Verb RunAs -Wait
    # konci 
    Write-Host "Skript byl restartován s administrátorskými právy."
}
