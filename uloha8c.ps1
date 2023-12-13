﻿# path
$filePath = "C:\Users\Hieu\Documents\WindowsPowerShell\meninboat.txt"

# read
$text = Get-Content -Path $filePath -Raw

$characters = $text -split ""

$characters = $characters | Where-Object { $_ -match '\S' }

# Pocita
$characterCount = $characters | Group-Object | Sort-Object Count -Descending

# Vypište seznam znaků, které se v textu vyskytují, a to sestupně podle počtu výskytů.
$characterCount | ForEach-Object {
    Write-Output "$($_.Name): $($_.Count)"
}
