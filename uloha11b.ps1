$imgs=(Invoke-WebRequest -Uri "https://pbase.com/galleries").Images.src
# Write-Output $imgs
$saveFolderPath="D:\4.rocnik-UNOB\1.semester\AplikovaneBezpecnostMilan\dl"

New-Item -ItemType Directory -Path $saveFolderPath -Force

foreach ($img in $imgs) {
    $imageName = [System.IO.Path]::GetFileName($img)
    $savePath = Join-Path $saveFolderPath $imageName
    Invoke-WebRequest -Uri $img -OutFile $savePath
   
}






