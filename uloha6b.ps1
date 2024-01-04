$faxPrinter = Get-CimInstance -ClassName Win32_Printer | Where-Object { $_.Name -eq 'Fax' }
if ($faxPrinter) {
    $faxPrinter.Location = "D:\Fax"
    Write-Host "Umístění faxové tiskárny bylo změněno na $($faxPrinter.Location)"
} else {
    Write-Host "Faxová tiskárna nebyla v systému nalezena"
}