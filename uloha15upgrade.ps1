$Path = "C:\Users\Hieu\Pictures"
$MaxScreenshots = 10

# checking or create folder
if (!(Test-Path $Path)) {
    New-Item -ItemType Directory -Force -Path $Path
}

# function for screenshoot
function Capture-Screenshot {
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $image = New-Object System.Drawing.Bitmap($screen.Width, $screen.Height)
    $graphic = [System.Drawing.Graphics]::FromImage($image)
    $point = New-Object System.Drawing.Point(0, 0)
    $graphic.CopyFromScreen($point, $point, $image.Size)
    $cursorBounds = New-Object System.Drawing.Rectangle([System.Windows.Forms.Cursor]::Position, [System.Windows.Forms.Cursor]::Current.Size)
    # Get a screenshot
    [System.Windows.Forms.Cursors]::Default.Draw($graphic, $cursorBounds)

    # create path
    $screen_file = "$Path\" + $env:computername + "_" + $env:username + "_" + "$((Get-Date).ToString('yyyy.MM.dd-HH.mm.ss')).png"
    
    # Save the screenshot as a PNG file
    $image.Save($screen_file, [System.Drawing.Imaging.ImageFormat]::Png)

    Write-Host "Screenshot captured and saved to $screen_file"
}

# 
for ($i = 1; $i -le $MaxScreenshots; $i++) {
    Capture-Screenshot
    Start-Sleep -Seconds 10  # interval 10s
}
