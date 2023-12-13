# Zjistěte vlastnosti třídy umožňující spravovat tiskárny
$printerClass = Get-CimClass -ClassName Win32_Printer
$printerClass.CimClassProperties | Select-Object Name, CimType

# Změňte umístění faxu
$faxPrinter = Get-CimInstance -ClassName Win32_Printer | Where-Object { $_.Name -eq 'Fax' }
if ($faxPrinter) {
    $faxPrinter.Location = "D:\Fax"
    $faxPrinter | Set-CimInstance
    Write-Host "Umístění faxové tiskárny bylo změněno na $($faxPrinter.Location)"
} else {
    Write-Host "Faxová tiskárna nebyla v systému nalezena"
}

# Zjistěte, jak se nazývá váš disk C: a případně ho přejmenujte na "Systém"
$systemDrive = Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }
if ($systemDrive) {
    if ($systemDrive.VolumeName -ne 'System') {
        $systemDrive.VolumeName = 'System'
        $systemDrive | Set-CimInstance
        Write-Host "Disk C: byl přejmenován na $($systemDrive.VolumeName)"
    } else {
        Write-Host "Disk C: již má název Systém"
    }
} else {
    Write-Host "C: nebyla v systému nalezena"
}
