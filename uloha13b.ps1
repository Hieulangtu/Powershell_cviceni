# Funkce pro získání informací o nainstalovaném softwaru pomocí WMI
function Get-InstalledSoftwareWMI {
    param (
        [string]$computerName = $env:COMPUTERNAME
    )

    $softwareList = Get-WmiObject -Query "SELECT * FROM Win32_Product" -ComputerName $computerName

    foreach ($software in $softwareList) {
        $softwareInfo = [PSCustomObject]@{
            "Source"          = "WMI"
            "DisplayName"     = $software.Name
            "Version"         = $software.Version
            "Publisher"       = $software.Vendor
            "InstallDate"     = $software.InstallDate
            "UninstallString" = $software.UninstallString
        }

        Write-Output $softwareInfo
    }
}

# Funkce pro získání informací o nainstalovaném softwaru pomocí Get-CimInstance
function Get-InstalledSoftwareCIM {
    $softwareList = Get-CimInstance -ClassName Win32_Product

    foreach ($software in $softwareList) {
        $softwareInfo = [PSCustomObject]@{
            "Source"          = "CIMInstance"
            "DisplayName"     = $software.Name
            "Version"         = $software.Version
            "Publisher"       = $software.Vendor
            "InstallDate"     = $software.InstallDate
            "UninstallString" = $software.UninstallString
        }

        Write-Output $softwareInfo
    }
}

# Funkce pro získání informací o nainstalovaném softwaru pomocí WMIC
function Get-InstalledSoftwareWMIC {
    $wmicList = wmic product get Name,Version,Vendor /format:csv

    $lines = $wmicList -split "`r`n" | Select-Object -Skip 1
    foreach ($line in $lines) {
        $data = $line -split ','
        if ($data.Count -eq 3) {
            $softwareInfo = [PSCustomObject]@{
                "Source"      = "WMIC"
                "DisplayName" = $data[0].Trim()
                "Version"     = $data[1].Trim()
                "Publisher"   = $data[2].Trim()
            }

            Write-Output $softwareInfo
        }
    }
}

# Funkce pro získání informací o nainstalovaném softwaru z registru
function Get-InstalledSoftwareRegistry {
    $uninstallKeys = @(
        'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
    )

    $applications = Get-ItemProperty -ErrorAction SilentlyContinue -Path $uninstallKeys |
                    Where-Object { $_.DisplayName -ne $null } |
                    Select-Object DisplayName, DisplayVersion, InstallDate

    $applications = $applications | ForEach-Object {
        [PSCustomObject]@{
            "Source"          = "Registry"
            "DisplayName"     = $_.DisplayName
            "Version"         = $_.DisplayVersion
            "InstallDate"     = $_.InstallDate
            "Publisher"       = $null  # Publisher information is not available in registry
            "UninstallString" = $null  # Uninstall string is not available in registry
        }
    }

    Write-Output $applications
}

# Zavolání všech funkcí pro získání informací o nainstalovaném softwaru
$installedSoftwareWMI = Get-InstalledSoftwareWMI
$installedSoftwareCIM = Get-InstalledSoftwareCIM
$installedSoftwareWMIC = Get-InstalledSoftwareWMIC
$installedSoftwareRegistry = Get-InstalledSoftwareRegistry

# Kombinace výsledků
$allInstalledSoftware = $installedSoftwareWMI + $installedSoftwareCIM + $installedSoftwareWMIC + $installedSoftwareRegistry

# Výpis výsledků
$allInstalledSoftware | Format-Table -AutoSize

# Porovnání s položkami v registru
$unmatchedInRegistry = Compare-Object -ReferenceObject $allInstalledSoftware -DifferenceObject $installedSoftwareRegistry -Property DisplayName, Version, InstallDate -IncludeEqual -ExcludeDifferent

# Výpis neshodujících se položek
if ($unmatchedInRegistry) {
    Write-Host "Neshodující se položky v registru:"
    $unmatchedInRegistry | ForEach-Object {
        Write-Host $_.DisplayName
    }
} else {
    Write-Host "Všechny nainstalované položky jsou shodné s registrem."
}