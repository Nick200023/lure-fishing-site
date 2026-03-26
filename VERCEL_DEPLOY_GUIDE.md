# 🚀 路亚钓鱼网站 - Vercel 部署指南

选择以下任一方式部署，推荐**方式一**（最快 5 分钟上线）

---

## 方式一：自动部署脚本 ⭐⭐⭐⭐⭐（最简单）

### 步骤

**1. 双击运行部署脚本**
```
找到文件：deploy-to-vercel.ps1
右键 → 使用 PowerShell 运行
```

**2. 按提示操作**
- 脚本会自动检查 Node.js
- 自动安装 Vercel CLI
- 打开浏览器让你登录
- 自动部署网站

**3. 等待完成**
- 部署需要 1-2 分钟
- 完成后自动打开浏览器
- 看到网站即成功！

### 可能遇到的问题

#### 问题 1：Node.js 未安装
```
解决：访问 https://nodejs.org/
下载 LTS 版本（绿色那个）
安装后重启 PowerShell
```

#### 问题 2：权限错误
```
解决：右键 PowerShell → 以管理员身份运行
然后运行：Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### 问题 3：npm 安装慢
```
解决：使用淘宝镜像
npm config set registry https://registry.npmmirror.com
```

---

## 方式二：手动命令行部署 ⭐⭐⭐⭐（灵活）

### 步骤

**1. 打开 PowerShell**
```powershell
# 切换到网站目录
cd "C:\Users\23418\OneDrive\桌面\lure-fishing-site"
```

**2. 安装 Vercel CLI**
```powershell
npm install -g vercel
```

**3. 登录 Vercel**
```powershell
vercel login
```
- 会打开浏览器
- 用 GitHub 账号登录
- 登录成功后返回 PowerShell

**4. 首次部署**
```powershell
vercel --prod
```

**5. 后续更新**
```powershell
# 修改文件后重新部署
vercel --prod
```

### 部署输出示例
```
Vercel CLI 32.0.0
🔍  Inspect: https://vercel.com/your-account/lure-fishing-site/xxx
✅  Production: https://lure-fishing-site.vercel.app
```

---

## 方式三：GitHub + Vercel 自动部署 ⭐⭐⭐⭐⭐（推荐生产环境）

### 优势
- ✅ 代码推送到 GitHub 自动部署
- ✅ 版本管理
- ✅ 回滚方便
- ✅ 团队协作

### 步骤

#### 1. 创建 GitHub 仓库
```
访问：https://github.com/new
仓库名：lure-fishing-site
可见性：Public
点击 Create repository
```

#### 2. 上传代码到 GitHub
```powershell
# 在網站目录打开 PowerShell
cd "C:\Users\23418\OneDrive\桌面\lure-fishing-site"

# 初始化 Git
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit - 路亚钓鱼网站"

# 关联 GitHub 仓库（替换为你的用户名）
git remote add origin https://github.com/你的用户名/lure-fishing-site.git

# 推送
git push -u origin main
```

#### 3. 在 Vercel 导入项目
```
1. 访问：https://vercel.com/new
2. 点击 "Import Git Repository"
3. 选择你的 lure-fishing-site 仓库
4. 点击 "Import"
5. 点击 "Deploy"
```

#### 4. 等待部署完成
- Vercel 会自动构建和部署
- 大约 1-2 分钟
- 完成后显示预览和正式地址

#### 5. 后续更新
```powershell
# 修改文件后
git add .
git commit -m "更新内容"
git push

# Vercel 会自动检测并重新部署
```

---

## 方式四：拖拽部署（无需命令行）⭐⭐⭐

### 步骤

**1. 访问 Vercel**
```
https://vercel.com/dashboard
```

**2. 登录/注册**
- 使用 GitHub 账号登录
- 没有 GitHub 账号？先注册一个

**3. 添加新项目**
```
点击 "Add New..." → "Project"
```

**4. 安装 Vercel for Desktop（可选）**
```
Vercel 会推荐你安装桌面应用
点击 "Download" 下载安装
```

**5. 拖拽部署**
```
把 lure-fishing-site 文件夹拖到 Vercel for Desktop
或者在网页版选择文件夹
```

**6. 等待完成**
- 上传需要 1-2 分钟
- 完成后显示网站地址

---

## 🎯 推荐方案对比

| 方式 | 难度 | 速度 | 推荐场景 |
|------|------|------|----------|
| **自动脚本** | ⭐ | ⭐⭐⭐⭐⭐ | 个人快速部署 |
| **手动命令行** | ⭐⭐ | ⭐⭐⭐⭐ | 学习 Vercel |
| **GitHub 集成** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 生产环境/团队 |
| **拖拽部署** | ⭐ | ⭐⭐⭐ | 不想用命令行 |

---

## 📝 部署后配置

### 1. 自定义域名（可选）

**在 Vercel 设置：**
```
1. 进入项目 Dashboard
2. Settings → Domains
3. 添加你的域名（如 lurefishing.com）
4. 按提示配置 DNS
```

**DNS 配置示例：**
```
类型    名称    内容
A       @      76.76.21.21
CNAME   www    cname.vercel-dns.com
```

### 2. 环境变量（如需要）

```
Settings → Environment Variables
添加变量：
- NEXT_PUBLIC_SITE_URL = https://你的域名
```

### 3. 自动部署设置

```
Settings → Git
- Auto Expose GitHub Deployments: On
- Preview Comments: On
```

---

## 🔍 验证部署

部署成功后，访问网站测试：

### 检查清单
- [ ] 首页能正常打开
- [ ] 导航链接都能跳转
- [ ] 图片能正常加载
- [ ] 搜索功能正常
- [ ] 筛选功能正常
- [ ] 移动端显示正常
- [ ] HTTPS 已启用（地址栏有小锁）

### 测试 URL
```
正式地址：https://lure-fishing-site.vercel.app
预览地址：https://lure-fishing-site-git-main-xxx.vercel.app
```

---

## ⚡ 性能优化建议

### 1. 图片优化
```powershell
# 运行图片下载脚本后
# 图片会自动压缩并优化
.\download-images.ps1
```

### 2. 启用缓存
Vercel 默认启用 CDN 缓存，无需配置

### 3. Gzip 压缩
Vercel 默认启用，无需配置

### 4. 懒加载
已在 HTML 中添加 `loading="lazy"`

---

## 📊 查看部署状态

### Vercel Dashboard
```
https://vercel.com/dashboard
```

### 部署历史
```
项目页面 → Deployments
可以看到：
- 每次部署时间
- 部署状态（成功/失败）
- 部署大小
- 提交信息
```

### 分析数据
```
项目页面 → Analytics
可以看到：
- 访问量
- 来源地区
- 设备类型
- 热门页面
```

---

## 🐛 常见问题解决

### Q1: 部署失败 "Command failed"
```
解决：
1. 检查 package.json 是否正确
2. 确保没有 build 错误
3. 查看完整错误日志
```

### Q2: 页面 404
```
解决：
1. 检查文件路径是否正确
2. 确保 index.html 在根目录
3. 重新部署
```

### Q3: 图片不显示
```
解决：
1. 检查图片路径（使用相对路径）
2. 确保图片文件已上传
3. 检查文件名大小写
```

### Q4: 自定义域名不生效
```
解决：
1. DNS 生效需要 24-48 小时
2. 检查 DNS 配置是否正确
3. 清除浏览器缓存
```

### Q5: 国内访问慢
```
解决：
1. 使用 Cloudflare CDN
2. 或考虑部署到国内平台（见下方）
```

---

## 🇨🇳 国内部署备选

如果 Vercel 国内访问慢，可以考虑：

### 1. GitHub Pages
```
设置 → Pages → 选择 main 分支
地址：https://用户名.github.io/lure-fishing-site
```

### 2. Gitee Pages（国内最快）
```
1. 同步代码到 Gitee
2. 服务 → Gitee Pages
3. 选择分支 → 启动
```

### 3. Netlify
```
https://netlify.com
拖拽部署，国内访问比 Vercel 稍快
```

---

## 📈 下一步

部署成功后：

1. **分享网站**
   - 发给钓友群
   - 发到钓鱼论坛
   - 朋友圈分享

2. **收集反馈**
   - 添加反馈表单
   - 收集用户建议
   - 持续改进

3. **SEO 优化**
   - 提交到搜索引擎
   - 添加 sitemap
   - 优化 meta 标签

4. **数据分析**
   - 添加百度统计
   - 监控访问数据
   - 分析用户行为

5. **持续更新**
   - 添加新钓点
   - 更新装备评测
   - 发布钓鱼技巧

---

## 🎉 部署成功！

如果遇到问题，随时问我！

**快速开始：**
```powershell
# 双击运行这个文件
deploy-to-vercel.ps1
```

祝部署顺利！🚀
