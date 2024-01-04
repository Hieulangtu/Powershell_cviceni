#Vytvoření aliasu pro notepad.exe
New-Alias -Name np -Value notepad.exe
#Vytvoření aliasu pro control.exe
New-Alias -Name ct -Value control.exe
#Exportování aliasů do JSON
$aliasData = Get-Alias np, ct | ForEach-Object {
[PSCustomObject]@{
Name = $.Name
Value = $.Definition
Option = $_.Options
}
} | ConvertTo-Json
$aliasData | Out-File -FilePath "alias.json"
#Odstranění aliasů
Remove-Item -Path Alias: np
Remove-Item -Path Alias: np
#Načtení aliasů z JSON a obnovení
$importedAliasData = Get-Content -Raw -Path "alias.json" | ConvertFrom-Json
foreach ($aliasEntry in $importedAliasData) {
New-Alias -Name $aliasEntry.Name -Value $aliasEntry.Value
}
#Zkouška zdali byl alias obnoven 
Get-Alias np