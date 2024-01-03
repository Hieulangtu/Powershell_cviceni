# Lấy nội dung HTML từ trang web
$url = "https://www.novinky.cz"
$response = Invoke-WebRequest -Uri $url
$htmlContent = $response.Content

# Sử dụng regex để lấy danh sách các liên kết
$regex = '<a\s+href=["'']([^"''>]+)["''].*?>(.*?)<\/a>'
$matches = [regex]::Matches($htmlContent, $regex)

# Tạo một hashtable để lưu trữ số lần xuất hiện của mỗi liên kết
$linkCounts = @{}

foreach ($match in $matches) {
    $url = $match.Groups[1].Value
    $text = $match.Groups[2].Value

    # Kiểm tra xem liên kết đã xuất hiện trước đó hay chưa
    if ($linkCounts.ContainsKey($url)) {
        $linkCounts[$url]++
    } else {
        $linkCounts[$url] = 1
    }
}

# Sắp xếp theo số lần xuất hiện giảm dần
$sortedLinks = $linkCounts.GetEnumerator() | Sort-Object Value -Descending

# Hiển thị kết quả
foreach ($link in $sortedLinks) {
    Write-Output "$($link.Key): $($link.Value) krat"
}

# Write-Output $linkCounts