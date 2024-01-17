# Zadejte z příkazové řádky příkaz netstat -a -o -p TCP. 
#Vytvořte v Powershellu podobný přehled o TCP spojeních, který ale bude obsahovat místo PIDu jméno odpovídající aplikace a "cestu k souboru image", jak se to nazývá ve Správci úloh.

# Získání informací o TCP spojeních
$tcpConnections = Get-NetTCPConnection

# Vytvoření přehledu s informacemi o jménu aplikace a cestě k souboru image
$result = foreach ($connection in $tcpConnections) {
    $process = Get-Process -Id $connection.OwningProcess -ErrorAction SilentlyContinue

    [PSCustomObject]@{
        LocalAddress   = $connection.LocalAddress
        LocalPort      = $connection.LocalPort
        RemoteAddress  = $connection.RemoteAddress
        RemotePort     = $connection.RemotePort
        State          = $connection.State
        ProcessName    = if ($process) { $process.ProcessName } else { "N/A" }
        ImagePath      = if ($process) { $process.Path } else { "N/A" }
    }
}

# Zobrazení výsledků
$result | Format-Table -AutoSize

