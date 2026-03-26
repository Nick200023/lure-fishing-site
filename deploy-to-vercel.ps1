# 路亚钓鱼网站 - Vercel 一键部署脚本
# 使用 PowerShell 自动完成部署

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  路亚钓鱼网站 - Vercel 部署工具" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# 检查 Node.js
Write-Host "[1/5] 检查 Node.js 安装..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "  ✓ Node.js 已安装：$nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "  ✗ Node.js 未安装" -ForegroundColor Red
    Write-Host ""
    Write-Host "  请先安装 Node.js: https://nodejs.org/" -ForegroundColor Yellow
    Write-Host "  安装后重新运行此脚本" -ForegroundColor Yellow
    exit
}

# 检查 Vercel CLI
Write-Host ""
Write-Host "[2/5] 检查 Vercel CLI..." -ForegroundColor Yellow
try {
    $vercelVersion = vercel --version 2>$null
    if (-not $vercelVersion) {
        throw "Not installed"
    }
    Write-Host "  ✓ Vercel CLI 已安装：$vercelVersion" -ForegroundColor Green
} catch {
    Write-Host "  ! Vercel CLI 未安装，正在安装..." -ForegroundColor Yellow
    npm install -g vercel
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  ✓ Vercel CLI 安装成功" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Vercel CLI 安装失败" -ForegroundColor Red
        Write-Host "  请手动运行：npm install -g vercel" -ForegroundColor Yellow
        exit
    }
}

# 登录 Vercel
Write-Host ""
Write-Host "[3/5] 登录 Vercel..." -ForegroundColor Yellow
Write-Host "  即将打开浏览器，请使用 GitHub 账号登录" -ForegroundColor Cyan
Write-Host ""
Start-Sleep -Seconds 2
vercel login

if ($LASTEXITCODE -ne 0) {
    Write-Host "  ✗ 登录失败" -ForegroundColor Red
    exit
}
Write-Host "  ✓ 登录成功" -ForegroundColor Green

# 部署
Write-Host ""
Write-Host "[4/5] 开始部署..." -ForegroundColor Yellow
Write-Host "  部署可能需要 1-2 分钟..." -ForegroundColor Cyan
Write-Host ""

# 切换到网站目录
$siteDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $siteDir

# 执行部署
$deployResult = vercel --prod 2>&1
Write-Host $deployResult

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "  ✓ 部署成功！" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "  ✗ 部署失败" -ForegroundColor Red
    exit
}

# 提取部署 URL
$deployUrl = $deployResult | Select-String "https://.*\.vercel\.app" | Select-Object -First 1
if ($deployUrl) {
    $deployUrl = $deployUrl.Matches.Value
}

Write-Host ""
Write-Host "[5/5] 部署完成！" -ForegroundColor Green
Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  🎉 部署成功！" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
if ($deployUrl) {
    Write-Host "  网站地址：$deployUrl" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  正在打开浏览器..." -ForegroundColor Yellow
    Start-Process $deployUrl
} else {
    Write-Host "  请在 Vercel 控制台查看部署地址" -ForegroundColor Yellow
    Write-Host "  https://vercel.com/dashboard" -ForegroundColor Cyan
}
Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
