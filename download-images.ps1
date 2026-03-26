# 路亚钓鱼网站图片下载脚本
# 使用 PowerShell 下载 Unsplash 真实照片

$imageDir = "C:\Users\23418\OneDrive\桌面\lure-fishing-site\images"
New-Item -ItemType Directory -Force -Path $imageDir | Out-Null

$images = @{
    "hero-bg.jpg" = "https://images.unsplash.com/photo-1544552866-d3ed42536cfd?w=1920&h=1080&fit=crop"
    "guide-rod.jpg" = "https://images.unsplash.com/photo-1594916745942-c79b5a00c9e5?w=800&h=600&fit=crop"
    "guide-cast.jpg" = "https://images.unsplash.com/photo-1542332213-31f87348057f?w=800&h=600&fit=crop"
    "guide-water.jpg" = "https://images.unsplash.com/photo-1478479405421-ce83c92fb3ba?w=800&h=600&fit=crop"
    "spot-qiandao.jpg" = "https://images.unsplash.com/photo-1506953823976-52e1fdc0149a?w=800&h=600&fit=crop"
    "spot-wanlv.jpg" = "https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?w=800&h=600&fit=crop"
    "spot-danjiang.jpg" = "https://images.unsplash.com/photo-1468581264429-2548ef9eb732?w=800&h=600&fit=crop"
    "gear-rod.jpg" = "https://images.unsplash.com/photo-1594916745942-c79b5a00c923?w=800&h=600&fit=crop"
    "gear-reel.jpg" = "https://images.unsplash.com/photo-1541604518499-af7d00642b4b?w=800&h=600&fit=crop"
    "gear-lure.jpg" = "https://images.unsplash.com/photo-1598289431512-b97b0917aff1?w=800&h=600&fit=crop"
    "catch-bass.jpg" = "https://images.unsplash.com/photo-1544552866-d3ed42536cfd?w=800&h=600&fit=crop"
    "catch-culter.jpg" = "https://images.unsplash.com/photo-1520186994231-6ea0019d8758?w=800&h=600&fit=crop"
}

Write-Host "开始下载路亚钓鱼网站图片..." -ForegroundColor Green
Write-Host "保存目录：$imageDir" -ForegroundColor Cyan
Write-Host ""

foreach ($item in $images.GetEnumerator()) {
    $filename = $item.Key
    $url = $item.Value
    $path = Join-Path $imageDir $filename
    
    Write-Host "下载：$filename" -NoNewline
    
    try {
        Invoke-WebRequest -Uri $url -OutFile $path -UseBasicParsing -TimeoutSec 30 | Out-Null
        Write-Host " [OK]" -ForegroundColor Green
    } catch {
        Write-Host " [失败]" -ForegroundColor Red
        Write-Host "  错误：$($_.Exception.Message)" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "下载完成！" -ForegroundColor Green
Write-Host "共下载 $($images.Count) 张图片" -ForegroundColor Cyan
