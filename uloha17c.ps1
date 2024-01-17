# Vytvořte skript, který vypíše aktuální kurz usd/czk, eur/usd, btc/usd a tia/usd.

$url = "https://api.exchangerate-api.com/v4/latest/USD?fbclid=IwAR3MJdPJ5AZgOWeUX8nyv-9X9AhP6GYWa80cuXjTL7pFPDJ8FiZ_uhhXAlk"
# Sử dụng Invoke-WebRequest để tải nội dung của trang web
$response = Invoke-RestMethod -Uri $url
#Write-Output $response.rates
$eur = $response.rates.EUR
$czk= $response.rates.CZK
Write-Output "1 USD = $eur EUR"
Write-Output "1 USD = $czk CZK"


$urll="https://financialmodelingprep.com/api/v3/quote/BTCUSD?apikey=cbzLlEyvAQGb0v5yE7Fl6Bmh5uZodJXz"
$res = Invoke-RestMethod -Uri $urll
#Write-Output $res
$btc=$res.price
Write-Output "1 BTC = $btc USD"



$urll="https://financialmodelingprep.com/api/v3/quote/TIAUSD?apikey=cbzLlEyvAQGb0v5yE7Fl6Bmh5uZodJXz"
$res1 = Invoke-RestMethod -Uri $urll
#Write-Output $res1
$tia=$res1.price
Write-Output "1 TIA = $tia USD"