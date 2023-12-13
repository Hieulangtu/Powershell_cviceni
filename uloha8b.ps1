# Vygenerujte 10 náhodných čísel mezi 10 a 100
$randomNumbers = Get-Random -Count 10 -InputObject (10..100)
Write-Host $randomNumbers
# vypište je spolu s jejich druhou mocninou
$squaredNumbers = $randomNumbers | ForEach-Object { $_ * $_ }
Write-Host $squaredNumbers
# Výpis proveďte do dvou sloupců, kde v prvním bude hodnota čísla a v druhém jeho mocnina
$table = @()
for ($i = 0; $i -lt 10; $i++) {
    $row = New-Object PSObject -Property @{
        Number = $randomNumbers[$i]
        Square = $squaredNumbers[$i]
    }
    $table += $row
}

# zarovnané
$table | Format-Table -AutoSize -Property Number, Square
