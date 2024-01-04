#Hexadecimální řetězec 
$s = "506f7765727368656c6c20697320617765736f6d6521" 
#Rozdělení hexadecimálního retezce na dvojice znaků a prevod kazde dvojce na ASCII a spojeni do reteze
$asciiString =( $s -split '(..)' | Where-Object { $_ } | ForEach-Object { [char]([Convert]::ToInt16($_, 16)) } ) -join ''
#výsledek
Write-Output $asciiString

