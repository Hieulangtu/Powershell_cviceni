# Mảng chứa 16 màu cơ bản
# $colors = @("Black", "Blue", "Cyan", "DarkBlue", "DarkCyan", "DarkGray", "DarkGreen", "DarkMagenta", "DarkRed", "DarkYellow", "Gray", "Green", "Magenta", "Red", "White", "Yellow")

# foreach ($color in $colors) {
#     $foregroundColor = "White"
#     $line = "$foregroundColor`t$($color.ToLower())"
#     Write-Host $line -ForegroundColor $foregroundColor -BackgroundColor $color
# }

# $colors = [enum]::GetValues([System.ConsoleColor])
# Foreach ($color in $colors){
#     Write-Host $color -NoNewLine
#     Write-Host $color -ForegroundColor $color -NoNewLine
#     Write-Host $color -BackgroundColor $color -ForegroundColor White 
# }


$colors = [enum]::GetValues([System.ConsoleColor])

foreach ($color in $colors) {
    $backgroundColor = $color

    # In ra từng cột trên cùng một dòng 
    #print
    Write-Host -NoNewLine ("{0,-12}" -f $color)
    Write-Host -NoNewLine ("{0,-12}" -f $color) -ForegroundColor $color
    Write-Host ("{0,-12}" -f $color) -BackgroundColor $color -ForegroundColor White
}

