# Vytvořte alias np (notepad.exe) a ct (control.exe)
Set-Alias -Name np -Value "notepad.exe"
Set-Alias -Name ct -Value "control.exe"

# Exportujte je do formátu JSON
$aliases = Get-Alias -Name np,ct| Select-Object Name, Definition| ConvertTo-Json | Set-Content -Path "D:\alias.json"


# smazat
Remove-Item alias:np -Force
Remove-Item alias:ct -Force

# obnovit
$aliasData = Get-Content -Path "D:\alias.json" -Raw | ConvertFrom-Json


$aliasData | ForEach-Object {
    Set-Alias -Name $_.Name -Value $_.Definition
}

# kontrole
Get-Alias
