Add-Type -AssemblyName System.Windows.Forms
#Cesta k textovému souboru pro záznam změn v schránce
$logfile = "D:\4.rocnik-UNOB\1.semester\AplikovaneBezpecnostMilan\WindowsPowerShell\13logfile.txt"
#Klíčové slovo k vyhledání
$keyword = "heslo"
function Monitor-Clipboard {
$lastClipboardContent = [System.Windows.Forms.Clipboard]::GetText()
while ($true) {
    $currentClipboardContent = [System.Windows.Forms.Clipboard]::GetText()
    if ($currentClipboardContent -ne $lastClipboardContent) {
        # Záznam do logu
        $LogChange = "Změna v schránce: $(Get-Date) - Obsah: $currentClipboardContent"
        $LogChange | Out-File -Append -FilePath $logfile

        if ($currentClipboardContent -match $keyword) {
            Write-Host -ForegroundColor Green "Nalezeno klíčové slovo: $keyword"
        }
    }
    $lastClipboardContent = $currentClipboardContent
}
}
#Spuštění monitorování
Monitor-Clipboard