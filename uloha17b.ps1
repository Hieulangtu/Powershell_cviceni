# Vytvořte soubor, zjistěte kdo má k němu přístupová práva, vypište celý SDDL. Ověřte, že jste jeho vlastníkem (owner). 
#Zjistěte SID vlastníka. Převeďte SID "S-1-5-32-544" na jméno účtu.

# Bước 1: Tạo tập tin
# New-Item -Path .\testfile.txt -ItemType File -Force

# Bước 2: Lấy thông tin quyền truy cập của tập tin
$acl = Get-Acl -Path "D:\4.rocnik-UNOB\1.semester\AplikovaneBezpecnostMilan\WindowsPowerShell\helloworld.txt"

# Bước 3: Hiển thị toàn bộ SDDL
$sddl = $acl.Sddl
Write-Host "Toàn bộ SDDL: $sddl"

# Bước 4: Kiểm tra xem bạn có phải là chủ sở hữu (owner) không
$isOwner = $acl.Owner -eq [System.Security.Principal.NTAccount]::new($env:USERNAME)
Write-Host "Bạn là chủ sở hữu: $isOwner"

# Bước 5: Lấy SID của chủ sở hữu
$ownerSid = $acl.Owner.Value
Write-Host "SID của chủ sở hữu: $ownerSid"

# Bước 6: Chuyển đổi SID "S-1-5-32-544" thành tên tài khoản
$accountName = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-32-544").Translate([System.Security.Principal.NTAccount]).Value
Write-Host "Tên tài khoản cho SID S-1-5-32-544: $accountName"

