$phrase = "Kobyla má malý bok"

# Chuyển đổi chuỗi thành mảng các ký tự và sắp xếp chúng
$sortedChars = $phrase.ToCharArray() | Sort-Object

Write-host $sortedChars