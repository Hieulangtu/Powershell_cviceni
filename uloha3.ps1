$s = "506f7765727368656c6c20697320617765736f6d6521"

# Konvertujte hexadecimální hodnotu na byte pole
$bytes = [byte[]]::new($s.Length / 2)

for ($i = 0; $i -lt $s.Length; $i += 2) {
    $byteValue = [byte]::Parse($s.Substring($i, 2), [System.Globalization.NumberStyles]::HexNumber)
    $bytes[$i / 2] = $byteValue
}

# Převedení byte pole na ASCII řetězec
$asciiString = [System.Text.Encoding]::ASCII.GetString($bytes)

$asciiString