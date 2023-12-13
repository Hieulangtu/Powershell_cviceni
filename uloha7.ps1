# Seznam nepoužitých účtů
$unusedAccounts = Get-LocalUser | Where-Object { $_.LastLogon -eq $null }

# Seznam uzamčených účtů
$lockedAccounts = Get-LocalUser | Where-Object { $_.Enabled -eq $false }

# Výpis seznamu nepoužitých účtů
Write-Output "Seznam nepoužitých účtů:"
$unusedAccounts | Format-Table -Property Name

# Výpis seznamu uzamčených účtů
Write-Output "`nSeznam uzamčených účtů:"
$lockedAccounts | Format-Table -Property Name, Enabled

# Lấy tất cả các tài khoản người dùng
$allAccounts = Get-LocalUser

# Lấy thông tin về thời điểm đăng nhập gần đây nhất cho từng tài khoản
$accountsWithLastLogon = $allAccounts | Select-Object Name, LastLogon

# Hiển thị thông tin
Write-Output "Thông tin về tài khoản và thời điểm đăng nhập gần đây nhất:"
$accountsWithLastLogon | Format-Table



