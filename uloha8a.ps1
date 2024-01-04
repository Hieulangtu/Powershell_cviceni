$phrase = "Kobyla má malý bok"
$phraseWithoutAccents = $phrase -replace 'á', 'a' -replace 'ý', 'y'
# Chuyển đổi chuỗi thành mảng các ký tự và sắp xếp chúng
# Převeďte řetězec na pole znaků a seřaďte je
$sortedChars = $phraseWithoutAccents.ToCharArray() | Sort-Object | Join-String -Separator '' 

Write-host $sortedChars