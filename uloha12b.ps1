#Vytvořte skript, který při vytvoření souboru ve vybraném adresáři zapíše do souboru outlog.txt informace o jméně souboru a čas jeho vytvoření.

#Cesta k adresáři, ktery budeme sledovat
$adresar = "D:\4.rocnik-UNOB\1.semester\AplikovaneBezpecnostMilan\WindowsPowerShell\checkoutlog"
#Cesta k outlog.txt souboru
$logSoubor = Join-Path $adresar "outlog.txt"
#Inicializujte FileSystemWatcher pro sledování změn v adresáři
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $adresar
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true
#Definujte akci, která se provede při vytvoření nového souboru
$action = {
    $soubor = $Event.SourceEventArgs.Name
    $casVytvoreni = (Get-Item $Event.SourceEventArgs.FullPath).CreationTime
    $zaznam = "Novy soubor: $soubor - $casVytvoreni"
    Add-Content -Path $logSoubor -Value $zaznam
}
#Připojení akcí k události vytvoření souboru
Register-ObjectEvent $watcher "Created" -Action $action
Write-Host "Zaznamenavam vytvoreni souboru v adresari $adresar. Stisknete Ctrl+C pro ukonceni."
#Udržuje skript spuštěný
while ($true) {
    Start-Sleep -Seconds 1
}