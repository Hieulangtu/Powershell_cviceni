#a.Vypište seznam odkazů na stránce www.novinky.cz sestupně podle počtu výskytů. Jaké číslo má sekce žena-zdraví?
$links= (Invoke-WebRequest -Uri "https://www.novinky.cz").Links.Href

# Write-Output $links

# vytvorit hash table
$linkCounts = @{}

foreach ($link in $links) {
    # counting
    if ($linkCounts.ContainsKey($link)) {
        $linkCounts[$link]++
    } else {
        $linkCounts[$link] = 1
    }
}

# sort descending
$sortedlinks = $linkCounts.GetEnumerator() | Sort-Object Value -Descending

#zobrazit vysledek
foreach ($link in $sortedlinks) {
    Write-Output "$($link.Key) - počtu výskytů : $($link.Value) "
}


$keyword1 = "zena"
$keyword2 = "zdravi"

$position = 1  

foreach ($link in $sortedLinks) {
    if ($link.Key -like "*$keyword1*" -and $link.Key -like "*$keyword2*") {
        Write-Output "číslo má sekce žena-zdraví : $position"
        break  # stop
    }

    $position++
}

# pokud nema
if ($position -gt $sortedLinks.Count) {
    Write-Output "nema sekce žena-zdraví."
}