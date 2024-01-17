# Install HTMLAgilityPack module (if not already installed)
# Install-Module -Name HTMLAgilityPack -Force -SkipPublisherCheck

# Import the HTMLAgilityPack module
Import-Module HTMLAgilityPack

# Địa chỉ URL của trang web cần truy cập
$url = "https://www.x-rates.com/calculator/"

# Sử dụng Invoke-WebRequest để tải nội dung của trang web
$response = Invoke-WebRequest -Uri $url

# Chuyển đổi nội dung HTML thành đối tượng HTMLDocument
$htmlDocument = New-Object -ComObject HTMLFile
$htmlDocument.IHTMLDocument2_write($response.Content)

# Sử dụng XPath để lấy giá trị của thẻ
$xpath = "/html/body/div[2]/div/div[3]/div[1]/div/div[1]/div/div/span[2]/text()"
$node = $htmlDocument.documentElement.SelectSingleNode($xpath)

Write-Output $node