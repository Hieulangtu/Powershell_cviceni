# $logParams = @{
#     'LogName'     = 'System'
#     'FilterXPath' = "*[System[Level=2]]"
# }

# Get-WinEvent @logParams | Where-Object {$_.TimeCreated -ge (Get-Date).AddDays(-10)}


#Vytvoření hashtable pro parametry
# $logParams = @{
#     LogName   = 'System'
#     EntryType = 'Error'
#     After     = (Get-Date).AddDays(-10)
#     Before    = Get-Date
#     Newest    = 10
#     }
#     #Získání událostí z logu System
#     $logEvents = Get-EventLog @logParams
#     #Vypsání informací s lehkou modifikací formátu
#     foreach ($event in $logEvents) {
#     Write-Output ("Čas: $($event.TimeGenerated)`nTyp: $($event.EntryType)`nZpráva: $($event.Message)`n")
#     }

# # Đặt tên log và loại sự kiện cần kiểm tra
# $logName = 'System'
# $eventType = 'Error'  # Hoặc 'Warning' nếu không có sự kiện lỗi

# # Tính ngày 10 ngày trước từ ngày hiện tại
# $startDate = (Get-Date).AddDays(-10)

# # Xây dựng hashtable chứa tham số cho Get-WinEvent cmdlet
# $params = @{
#     LogName = $logName
#     StartTime = $startDate
#     Level = $eventType
# }

# # Lấy sự kiện từ Log Hệ thống
# $events = Get-WinEvent @params

# # Kiểm tra xem có sự kiện nào không
# if ($events.Count -eq 0) {
#     Write-Host "V logu '$logName' není žádná událost typu '$eventType' za posledních 10 dní."
# } else {
#     # Hiển thị thông tin về các sự kiện
#     $events | ForEach-Object {
#         Write-Host "Čas: $($_.TimeCreated), Zpráva: $($_.Message)"
#     }
# }

# $logParams = @{
#     'LogName'     = 'System'
#     'FilterXPath' = "*[System[Level=2]]"
# }
# Get-WinEvent @logParams | Where-Object {$_.TimeCreated -ge (Get-Date).AddDays(-10)}

#Vytvoření hashtable pro parametry
$logParams = @{
    LogName   = 'System'
    EntryType = 'Error'
    After     = (Get-Date).AddDays(-10)
    Before    = Get-Date
    Newest    = 10
    }
    #get events even-log
    $logEvents = Get-EventLog @logParams
    #Vypsání informací s lehkou modifikací formátu
    foreach ($event in $logEvents) {
    Write-Output ("Time: $($event.TimeGenerated)`nType: $($event.EntryType)`nMessage: $($event.Message)`n")
    }