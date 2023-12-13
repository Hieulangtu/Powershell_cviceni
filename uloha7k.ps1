# Lấy danh sách tất cả tài khoản người dùng trên máy tính
$userAccounts = Get-CimInstance -ClassName Win32_UserAccount

# Lặp qua từng tài khoản để kiểm tra thời gian đăng nhập gần đây nhất
foreach ($userAccount in $userAccounts) {
    $lastLogon = Get-CimInstance -ClassName Win32_NetworkLoginProfile | Where-Object { $_.Name -eq $userAccount.Name } | Select-Object -Property LastLogon | Sort-Object -Property LastLogon -Descending | Select-Object -First 1

    # Nếu tài khoản chưa đăng nhập hoặc đã đăng nhập nhưng thời gian đăng nhập gần đây nhất là quá 90 ngày
    if (-not $lastLogon -or $lastLogon.LastLogon -lt (Get-Date).AddDays(-90)) {
        Write-Host "Tài khoản không sử dụng: $($userAccount.Name)"
        
        if ($lastLogon) {
            Write-Host "Thời gian đăng nhập gần đây nhất: $($lastLogon.LastLogon)"
        } else {
            Write-Host "Tài khoản chưa đăng nhập."
        }

        Write-Host "------------------------"
    }
}

# Lấy thông tin về tất cả các tài khoản đăng nhập gần đây nhất
$loggedInUsers = Get-CimInstance -ClassName Win32_NetworkLoginProfile | Sort-Object -Property LastLogon -Descending

# Lặp qua từng tài khoản đang đăng nhập
foreach ($user in $loggedInUsers) {
    Write-Host "Tài khoản đang sử dụng: $($user.Name)"
    Write-Host "Thời gian đăng nhập gần đây nhất: $($user.LastLogon)"
    Write-Host "------------------------"
}

# Lấy danh sách các tài khoản người dùng trên máy tính
$userAccounts = Get-LocalUser

# Hiển thị thông tin
Write-Host "Danh sách tài khoản người dùng:"
$userAccounts | Format-Table Name, Enabled -AutoSize


