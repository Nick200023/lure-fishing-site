# 路亚钓鱼网站部署指南

本文档提供 3 种免费部署方案，选择任一即可上线。

---

## 方案 1：GitHub Pages（最简单 ⭐⭐⭐⭐⭐）

### 步骤

1. **创建 GitHub 仓库**
   ```bash
   # 在 GitHub 创建新仓库，例如：lure-fishing-site
   ```

2. **上传文件**
   ```bash
   # 将网站所有文件上传到仓库
   # 可以直接拖拽上传，或使用 Git 命令
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/你的用户名/lure-fishing-site.git
   git push -u origin main
   ```

3. **启用 GitHub Pages**
   - 进入仓库 Settings → Pages
   - Source 选择 `main` 分支
   - 点击 Save

4. **访问网站**
   ```
   https://你的用户名.github.io/lure-fishing-site/
   ```

### 优点
- ✅ 完全免费
- ✅ 配置简单
- ✅ 自动 HTTPS
- ✅ 自带 CDN

### 缺点
- ❌ 国内访问可能慢

---

## 方案 2：Vercel（推荐 ⭐⭐⭐⭐⭐）

### 步骤

1. **注册 Vercel**
   - 访问 https://vercel.com
   - 用 GitHub 账号登录

2. **导入项目**
   - 点击 "Add New Project"
   - 选择 "Import Git Repository"
   - 选择你的 lure-fishing-site 仓库

3. **部署**
   - 点击 "Deploy"
   - 等待 1-2 分钟完成

4. **访问网站**
   ```
   https://lure-fishing-site.vercel.app
   ```

### 自定义域名（可选）
```
1. 在 Vercel Dashboard → Settings → Domains
2. 添加你的域名
3. 按提示配置 DNS
```

### 优点
- ✅ 全球 CDN 加速
- ✅ 自动 HTTPS
- ✅ 支持自定义域名
- ✅ 国内访问较快
- ✅ 自动部署（代码更新后）

### 缺点
- ❌ 需要 GitHub 账号

---

## 方案 3：Netlify（备选 ⭐⭐⭐⭐）

### 步骤

1. **注册 Netlify**
   - 访问 https://netlify.com
   - 用 GitHub 账号登录

2. **创建站点**
   - 点击 "Add new site" → "Import an existing project"
   - 选择 GitHub 仓库

3. **部署配置**
   ```
   Build command: (留空)
   Publish directory: (留空)
   ```

4. **部署**
   - 点击 "Deploy site"
   - 等待完成

5. **访问网站**
   ```
   https://你的站点名.netlify.app
   ```

### 优点
- ✅ 免费
- ✅ 自动 HTTPS
- ✅ 支持表单（评论功能可用）
- ✅ 拖拽部署（无需 Git）

### 缺点
- ❌ 国内访问一般

---

## 本地测试

部署前建议本地测试：

### 方法 1：直接打开
```bash
# 双击 index.html 即可在浏览器打开
```

### 方法 2：本地服务器（推荐）
```bash
# 使用 Python
cd lure-fishing-site
python -m http.server 8000

# 访问 http://localhost:8000
```

### 方法 3：使用 Live Server（VS Code）
```
1. 安装 Live Server 扩展
2. 右键 index.html → Open with Live Server
```

---

## 图片优化建议

部署前优化图片加载速度：

### 1. 压缩图片
```bash
# 使用 TinyPNG
https://tinypng.com/

# 或使用命令行工具
npm install -g imagemin-cli
imagemin images/* --out-dir=images-optimized
```

### 2. 使用 WebP 格式
```bash
# 转换图片为 WebP
convert image.jpg image.webp
```

### 3. 懒加载
```html
<!-- 在 img 标签添加 loading="lazy" -->
<img src="image.jpg" loading="lazy" alt="描述">
```

---

## 评论功能集成

使用第三方评论系统（无需后端）：

### 方案 1：Disqus（国际）
```html
<!-- 在页面添加 -->
<div id="disqus_thread"></div>
<script>
  var disqus_config = function () {
    this.page.url = PAGE_URL;
    this.page.identifier = PAGE_IDENTIFIER;
  };
  (function() {
    var d = document, s = d.createElement('script');
    s.src = 'https://你的短名称.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
  })();
</script>
```

### 方案 2： utterances（GitHub 评论）
```html
<script src="https://utteranc.es/client.js"
        repo="你的用户名/你的仓库"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
```

### 方案 3：Waline（国内推荐）
```
文档：https://waline.js.org/
- 支持微信/QQ 登录
- 国内访问快
- 免费
```

---

## SEO 优化

提高搜索引擎排名：

### 1. 添加 Meta 标签
```html
<head>
  <meta name="description" content="专业路亚钓鱼平台，提供入门教程、钓点地图、装备评测">
  <meta name="keywords" content="路亚，钓鱼，装备，钓点，教程">
  <meta name="author" content="路亚钓鱼网">
  
  <!-- Open Graph（社交媒体分享） -->
  <meta property="og:title" content="路亚钓鱼网">
  <meta property="og:description" content="专业路亚钓鱼平台">
  <meta property="og:image" content="https://你的域名/og-image.jpg">
</head>
```

### 2. 创建 sitemap.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://你的域名/</loc>
    <lastmod>2026-03-26</lastmod>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://你的域名/guide.html</loc>
    <priority>0.8</priority>
  </url>
</urlset>
```

### 3. 提交到搜索引擎
- 百度：https://ziyuan.baidu.com/
- Google：https://search.google.com/search-console

---

## 性能优化

### 1. 启用 Gzip 压缩
```
Vercel/Netlify 默认启用，无需配置
```

### 2. 使用 CDN
```
Vercel/Netlify/GitHub Pages 都自带 CDN
```

### 3. 减少 HTTP 请求
```
- 合并 CSS/JS 文件
- 使用雪碧图
- 内联小图标（SVG）
```

---

## 域名购买（可选）

### 国内注册商
- 阿里云：https://wanwang.aliyun.com/
- 腾讯云：https://cloud.tencent.com/product/domain
- 华为云：https://www.huaweicloud.com/product/domain.html

### 国际注册商
- Namecheap：https://www.namecheap.com/
- GoDaddy：https://www.godaddy.com/
- Cloudflare：https://www.cloudflare.com/

### 推荐域名
```
lurefishing.com      （国际）
lure-diaoyu.com      （拼音）
52lure.com           （数字 + 英文）
lure123.com          （好记）
```

---

## 部署检查清单

部署前确认：

- [ ] 所有 HTML 文件正常打开
- [ ] 图片路径正确
- [ ] 链接都能跳转
- [ ] 移动端显示正常
- [ ] 已添加 favicon
- [ ] 已优化图片大小
- [ ] 已测试搜索功能
- [ ] 已测试筛选功能
- [ ] 已添加统计代码（可选）

---

## 网站统计（可选）

### 百度统计
```html
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?你的统计 ID";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
```

### Google Analytics
```html
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

### 51.la（国内）
```
https://www.51.la/
- 免费
- 国内访问快
- 数据详细
```

---

## 常见问题

### Q: 部署后页面空白？
A: 检查控制台错误，通常是路径问题，确保使用相对路径

### Q: 图片加载失败？
A: 检查图片路径，确保图片已上传到正确目录

### Q: 自定义域名不生效？
A: DNS 生效需要 24-48 小时，耐心等待

### Q: 如何更新网站？
A: 修改文件后重新 push 到仓库，Vercel/Netlify 会自动部署

---

## 下一步

部署成功后：

1. **分享网站** - 发给钓友群、论坛
2. **持续更新** - 添加新钓点、新装备
3. **收集反馈** - 根据用户建议改进
4. **SEO 优化** - 提高搜索排名
5. **增加功能** - 评论、地图、渔获记录

祝部署顺利！🎉
