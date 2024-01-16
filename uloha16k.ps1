# informace
$credentials = Get-Credential 



$smtpServer = "smtp.unob.cz"
$smtpFrom = "trunghieu.nguyen@unob.cz"
$smtpTo = "jirsamilan@gmail.com"
$messageSubject = "Testovaci email - Uloha 16"
$messageBody = " uloha 16"

# hashtable with config infor
$emailParams = @{
    SmtpServer = $smtpServer
    From = $smtpFrom
    To = $smtpTo
    Subject = $messageSubject
    Body = $messageBody
    Port = 587
    UseSsl = $true
    Credential = $credentials
}

# send email
Send-MailMessage @emailParams 
