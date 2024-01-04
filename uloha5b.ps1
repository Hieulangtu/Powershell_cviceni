# cesta do Registry
$registryPath = "HKCU:\Hratky_s_powerShellem"
# Vytvořte podklíč registru
New-Item -Path $registryPath 

# jmeno 
$valueName_Account = "UserName"
$valueName_Computer = "ComputerName"
$valueName_Date = "CurrentDate"
$valueName_PowerShellVersion = "PowerShellVersion"

# value
$userName = $env:USERNAME
$computerName = $env:COMPUTERNAME
$currentDate = Get-Date -Format "yyyy-MM-dd"
$powerShellVersion = $PSVersionTable.PSVersion


# V něm vytvořte hodnoty obsahující jméno vašeho uživatelského účtu, jméno počítače, aktuální datum a verzi PowerShellu
Set-ItemProperty -Path $registryPath -Name $valueName_Account -Value $userName
Set-ItemProperty -Path $registryPath -Name $valueName_Computer -Value $computerName
Set-ItemProperty -Path $registryPath -Name $valueName_Date -Value $currentDate
Set-ItemProperty -Path $registryPath -Name $valueName_PowerShellVersion -Value $powerShellVersion

# potvrzení provedené akce 
Write-Output "Informace byla zaznamenána do Registry:"
Get-Item -Path $registryPath | Get-ItemProperty | Format-List
