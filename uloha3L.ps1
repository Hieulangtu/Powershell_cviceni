#Hexadecimální řetězec 
$s = "506f7765727368656c6c20697320617765736f6d6521" 
#Rozdělení hexadecimálního řetězce na dvojice znaků 
$hexPairs = $s -split '(..)' | Where-Object { $_ } 
#Převod každé dvojice na ASCII hodnotu a spojení do řetězce
$asciiString = ($hexPairs | ForEach-Object { [char]([Convert]::ToInt32($_, 16)) }) -join ''
#Vypsání výsledku
Write-Output $asciiString