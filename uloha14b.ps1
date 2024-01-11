#Aktualizujte si antivirovou databázi.
Update-MpSignature
$threatCatalog = Get-MpThreatCatalog
# Write-Host $threatCatalog
#Celkový počet detekovaných hrozeb  je schopen detekovat Windows Defender
$totalThreatCount = $threatCatalog.Count
#Rozdělení názvů hrozeb podle první části oddělené dvojtečkou
$splitThreatNames = $threatCatalog | ForEach-Object { $_.ThreatName.Split(':')[0] }
#třídit hrozby podle snižování výskytu
$groupedThreats = $splitThreatNames | Group-Object | Sort-Object -Property Count -Descending
#Výběr nejčastějšího typu hrozby
$mostCommonThreatType = $groupedThreats | Select-Object -First 1
#Výpis informací o detekovaných hrozbách
Write-Host "Celkový počet hrozeb: $totalThreatCount"
Write-Host "Nejčastější typ hrozby: $($mostCommonThreatType.Name)"
Write-Host "Počet výskytů tohoto typu: $($mostCommonThreatType.Count)"