# Vytvořte v Powershellu interaktivní textové rozhraní, které uživateli umožní procházet adresářovou strukturu.
# Vždy se zobrazí informace o obsahu adresáře, počtu souborů, minimální a maximální velikost souboru.
# Vypíše očíslovaný seznam adresářů, stiskem odpovídajícího čísla přejdu do vybraného adresáře.
# Stiskem klávesy U přejdu v adresářové struktuře o úroveň výš.
# Stiskem klávesy Q se program ukončí.

function DirectoryNavigace {
    $currentDirectory = Get-Location

    while ($true) {
        Write-Host "----------------------------"
        
        $directories = Get-ChildItem -Directory -Path $currentDirectory
        $Files = Get-ChildItem -File -Path $currentDirectory
        Write-Host "Number of Directories: $($directories.Count)"
        Write-Host "Number of Files: $($Files.Count)"

        $minFileSize = $Files | Measure-Object -Property Length -Minimum | Select-Object -ExpandProperty Minimum
        $maxFileSize = $Files | Measure-Object -Property Length -Maximum | Select-Object -ExpandProperty Maximum
        Write-Host "Min Size: $minFileSize bytes"
        Write-Host "Max Size: $maxFileSize bytes"

        Write-Host "----------------------------"

        Write-Host "Directories:"
        for ($i = 0; $i -lt $directories.Count; $i++) {
            Write-Host "$($i + 1). $($directories[$i].Name)"
        }

        Write-Host "---------------------------------------------"
        Write-Host "Vyberte akci:"
        Write-Host "  N. Zobrazit obsah adresáře"
        Write-Host "  U. Přejít o úroveň výš"
        Write-Host "  Q. Konec"

        $input = Read-Host "Vyber : "

        if ($input -match '^[1-9][0-9]?$') {
            $selectedDirectory = $directories[$input - 1]
            $currentDirectory = $selectedDirectory.FullName
        }
        elseif ($input -eq 'U') {
            $currentDirectory = Split-Path -Path $currentDirectory -Parent
        }
        elseif ($input -eq 'Q') {
            return
        }
        else {
            Write-Host "Neplatný vstup. Zkuste to znovu"
            Start-Sleep -Seconds 2
        }
    }
}

DirectoryNavigace