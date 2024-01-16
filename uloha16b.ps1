#b.Vytvořte skript, který vypíše úspěšná a neúspešná přihlášení uživatelů MS Windows. V případě neúspěšného přihlášení vypište i důvod neúspěchu.
# Definice cesty k logu
$logPath = "Security"

# Získání neúspěšných přihlášení
$failedLogins = Get-WinEvent -LogName $logPath -FilterXPath "*[System[(EventID=4625)]]"

# Získání všech přihlášení
$allLogins = Get-WinEvent -LogName $logPath -FilterXPath "*[System[(EventID=4624)]]"

Write-Host "`nNeúspěšná přihlášení s důvodem:`n"

foreach ($event in $failedLogins) {
    $userName = $event.Properties[5].Value
    $status = $event.Properties[8].Value

    # Funkce pro získání popisu důvodu neúspěšného přihlášení
    function Get-FailureReason {
        param (
            [string]$status
        )

        switch ($status) {
            "0xC0000064" { "Uživatelské jméno neexistuje" }
            "0xC000006A" { "Uživatelské jméno je správné, ale heslo je chybné" }
            "0xC0000234" { "Uživatel je aktuálně uzamčen" }
            "0xC0000072" { "Účet je aktuálně zakázán" }
            "0xC000006F" { "Uživatel se pokusil přihlásit mimo svůj den nebo časová omezení" }
            "0xC0000070" { "Omezení pracoviště nebo porušení politiky ověřování" }
            "0xC0000193" { "Platnost účtu vypršela" }
            "0xC0000071" { "Vypršelo heslo" }
            "0xC0000133" { "Rozdíl v čase mezi DC a jiným počítačem je příliš velký" }
            "0xC0000224" { "Uživatel je povinen změnit heslo při příštím přihlášení" }
            "0xC0000225" { "Zřejmě chyba ve Windows a není riziko" }
            "0xc000015b" { "Uživateli nebylo uděleno požadované přihlašovací oprávnění na tomto počítači" }
            default { "Neznámý důvod" }
        }
    }

    $failureReason = Get-FailureReason -status $status

    Write-Host "Čas: $($event.TimeCreated)"
    Write-Host "Uživatel: $userName"
    Write-Host "Důvod: $failureReason`n"
}

Write-Host "Úspěšná přihlášení s logon type 2:`n"

foreach ($event in $allLogins) {
    $userName = $event.Properties[5].Value
    $logonType = $event.Properties[8].Value

    if ($logonType -eq 2) {
        Write-Host "Čas: $($event.TimeCreated)"
        Write-Host "Uživatel: $userName`n"
    }
}