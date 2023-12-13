
Set-Alias -Name np -Value "notepad.exe"
Set-Alias -Name ct -Value "control.exe"

#Export-Alias -Path 'D:\IT\powershell\aliases.json' -Force
#Get-Alias  -Name np, ct| ConvertTo-Json | Set-Content -Path "D:\IT\powershell\aliases.json"
#Export-Alias -Path "D:\IT\powershell\aliases.json" | ConvertTo-Json | Set-Content -Path "D:\IT\powershell\aliases.json"

# Export aliases to JSON
$aliases = Get-Alias -Name np,ct| Select-Object Name, Definition
$aliases | ConvertTo-Json | Out-File -FilePath "D:\alias.json"

Remove-Item Alias:\np
Remove-Item Alias:\ct

$jsonContent = Get-Content -Path "D:\alias.json" -Raw

$aliases = ConvertFrom-Json $jsonContent

$aliases | ForEach-Object {
    Set-Alias -Name $_.Name -Value $_.Definition
}

# kontrole
Get-Alias