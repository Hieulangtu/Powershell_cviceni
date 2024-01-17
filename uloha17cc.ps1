#vytvorte soubor, zjistete kdo ma k nemu pristupova prava, vypiste cely SDDL. Overte, ze jste jeho vlastnikem. Zjistete SID vlastnika. Prevedte SID "S-1-5-32-544" na jmeno uctu
# Název souboru
# $soubor = "D:\4.rocnik-UNOB\1.semester\AplikovaneBezpecnostMilan\WindowsPowerShell\helloworld.txt"

# # Vytvoření souboru
# New-Item -Path $soubor -ItemType File -Force

# Zjištění cestu souboru
$acl = Get-Acl -Path "D:\4.rocnik-UNOB\1.semester\AplikovaneBezpecnostMilan\WindowsPowerShell\helloworld.txt"

# Vypsát SDDL
$sddl = $acl.Sddl
Write-Host "SDDL: $sddl"

# Ověření, zda jsem vlastníkem
$isOwner = $acl.Owner -eq [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
Write-Host "Jsem vlastníkem: $isOwner"

# Zjištění SID vlastníka
$ownerSid = $acl.Owner
Write-Host "SID vlastníka: $ownerSid"

#Převeďte SID
# SID to be translated
$sidToTranslate = "S-1-5-32-544"
# Convert SID to SecurityIdentifier object
$securityIdentifier = New-Object System.Security.Principal.SecurityIdentifier($sidToTranslate)
# Translate SID to NTAccount
$ntAccount = $securityIdentifier.Translate([System.Security.Principal.NTAccount])
# Get the account name
$accountName = $ntAccount.Value
# Display the result
Write-Host "Account name for SID $sidToTranslate : $accountName"
