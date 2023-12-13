# Đường dẫn đến Registry key liên quan đến Numlock
$registryPath = "HKCU:\Control Panel\Keyboard"
$registryItemName = "InitialKeyboardIndicators"

# Đọc giá trị hiện tại của Numlock
$currentNumlockValue = (Get-ItemProperty -Path $registryPath).$registryItemName

# Kiểm tra xem Numlock đã được bật hay không
if ($currentNumlockValue -band 2) {
    Write-Output "Numlock is already turned on."
} else {
    Write-Output "Numlock is not turned on. Setting Numlock to 2."

    # Đặt giá trị Numlock trong Registry thành 2
    Set-ItemProperty -Path $registryPath -Name $registryItemName -Value 2
}
