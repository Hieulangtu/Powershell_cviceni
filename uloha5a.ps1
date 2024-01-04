# Đường dẫn đến Registry key liên quan đến Numlock
# Cesta ke klíči registru souvisejícímu s Numlockem
$registryPath = "HKCU:\Control Panel\Keyboard"
$registryItemName = "InitialKeyboardIndicators"

# Đọc giá trị hiện tại của Numlock
# Přečtěte si aktuální hodnotu Numlock
$currentNumlockValue = (Get-ItemProperty -Path $registryPath).$registryItemName

# Kiểm tra xem Numlock đã được bật hay không
# Zkontrolujte, zda je funkce Numlock povolena nebo ne
if ($currentNumlockValue -band 2) {
    Write-Output "Numlock is already turned on."
} else {
    Write-Output "Numlock is not turned on. Setting Numlock to 2."

    # set Numlock in Registry to 2
    Set-ItemProperty -Path $registryPath -Name $registryItemName -Value 2
}
