# 部署指南

本文档详细说明如何将博客部署到 Cloudflare Pages。

## 前置准备

- ✅ GitHub 账号
- ✅ Cloudflare 账号（免费）
- ✅ 博客已在本地测试通过

## 步骤 1：推送到 GitHub

### 1.1 创建 GitHub 仓库

1. 访问 https://github.com/new
2. 仓库名：`my-awesome-blog`
3. 设置为 **Public**（Giscus 评论需要）
4. 不要勾选 "Add README" 等选项
5. 点击 "Create repository"

### 1.2 初始化 Git 并推送

```bash
cd D:\games\AI\win小玩意\个人博客\my-awesome-blog

# 初始化 Git（如果还没有）
git init

# 添加所有文件
git add .

# 创建第一个提交
git commit -m "Initial commit: Hugo blog with PaperMod theme"

# 添加远程仓库（替换为你的用户名）
git remote add origin https://github.com/yourusername/my-awesome-blog.git

# 推送到 GitHub
git push -u origin main
```

如果推送失败（分支名是 master 而不是 main）：
```bash
git branch -M main
git push -u origin main
```

## 步骤 2：部署到 Cloudflare Pages

### 2.1 连接 GitHub 仓库

1. 登录 https://dash.cloudflare.com
2. 左侧菜单选择 **Workers & Pages**
3. 点击 **Create application**
4. 选择 **Pages** 标签
5. 点击 **Connect to Git**
6. 授权 Cloudflare 访问你的 GitHub
7. 选择 `my-awesome-blog` 仓库

### 2.2 配置构建设置

| 设置项 | 值 |
|--------|-----|
| **Project name** | `my-awesome-blog` |
| **Production branch** | `main` |
| **Framework preset** | `Hugo` |
| **Build command** | `hugo --minify` |
| **Build output directory** | `public` |

### 2.3 设置环境变量

点击 **Environment variables (advanced)**，添加：

| 变量名 | 值 | 说明 |
|--------|-----|------|
| `HUGO_VERSION` | `0.121.0` | Hugo 版本号 |
| `NODE_VERSION` | `18` | Node.js 版本（可选） |

### 2.4 开始部署

1. 点击 **Save and Deploy**
2. 等待构建完成（通常 1-2 分钟）
3. 构建成功后会显示访问 URL，例如：
   - `https://my-awesome-blog.pages.dev`

## 步骤 3：配置 Giscus 评论

### 3.1 启用 GitHub Discussions

1. 进入你的 GitHub 仓库
2. 点击 **Settings** 标签
3. 滚动到 **Features** 部分
4. 勾选 **Discussions**

### 3.2 安装 Giscus 应用

1. 访问 https://github.com/apps/giscus
2. 点击 **Install**
3. 选择 **Only select repositories**
4. 选择 `my-awesome-blog`
5. 点击 **Install**

### 3.3 获取配置参数

1. 访问 https://giscus.app/zh-CN
2. 在 "仓库" 输入框填写：`yourusername/my-awesome-blog`
3. 等待验证通过（显示绿色勾）
4. 在 "Discussion 分类" 选择 `Announcements`
5. 滚动到底部，复制生成的代码中的两个 ID：
   - `data-repo-id="R_xxxxx"`
   - `data-category-id="DIC_xxxxx"`

### 3.4 更新博客配置

编辑 `layouts/partials/comments.html`：

```html
<script src="https://giscus.app/client.js"
  data-repo="yourusername/my-awesome-blog"
  data-repo-id="R_xxxxx"              <!-- 替换这里 -->
  data-category="Announcements"
  data-category-id="DIC_xxxxx"        <!-- 替换这里 -->
  ...
</script>
```

### 3.5 推送更新

```bash
git add layouts/partials/comments.html
git commit -m "Configure Giscus comments"
git push
```

Cloudflare Pages 会自动重新部署。

## 步骤 4：配置 Cloudflare Web Analytics

### 4.1 创建 Web Analytics 站点

1. 在 Cloudflare Dashboard 左侧菜单选择 **Analytics & Logs**
2. 选择 **Web Analytics**
3. 点击 **Add a site**
4. 输入你的博客域名：`my-awesome-blog.pages.dev`
5. 勾选 **Automatic setup**（因为使用 Cloudflare Pages）
6. 点击 **Done**

### 4.2 方案 A：自动设置（推荐）

如果你选择了 "Automatic setup"：

1. 进入 Pages 项目：Workers & Pages → my-awesome-blog
2. 点击 **Settings** → **Analytics**
3. 点击 **Enable Web Analytics**

完成！无需修改代码。

### 4.3 方案 B：手动设置

如果需要手动配置：

1. 在 Web Analytics 页面复制 Beacon Token
2. 编辑 `layouts/partials/extend_head.html`
3. 替换 `YOUR_CLOUDFLARE_TOKEN` 为实际 token
4. 推送更新

```bash
git add layouts/partials/extend_head.html
git commit -m "Add Cloudflare Web Analytics"
git push
```

## 步骤 5：自定义域名（可选）

### 5.1 添加自定义域名

1. 在 Cloudflare Pages 项目页面
2. 点击 **Custom domains** 标签
3. 点击 **Set up a custom domain**
4. 输入你的域名：`blog.example.com`
5. 按照提示添加 DNS 记录

### 5.2 更新博客配置

编辑 `hugo.toml`：

```toml
baseURL = "https://blog.example.com/"
```

推送更新：

```bash
git add hugo.toml
git commit -m "Update baseURL to custom domain"
git push
```

## 验证部署

### 检查清单

- [ ] 博客可以正常访问
- [ ] 文章页面显示正常
- [ ] 评论系统可以加载
- [ ] 搜索功能可用
- [ ] RSS 订阅链接有效
- [ ] 归档页面显示所有文章
- [ ] 标签和分类功能正常
- [ ] 移动端显示正常

### 测试评论

1. 访问任意文章页面
2. 滚动到评论区
3. 点击 "Sign in with GitHub"
4. 授权后发表测试评论
5. 回到 GitHub 仓库的 Discussions 查看

### 查看统计数据

1. 登录 Cloudflare Dashboard
2. 进入 Analytics & Logs → Web Analytics
3. 选择你的站点
4. 15-30 分钟后可以看到访问数据

## 日常工作流

### 发布新文章

```bash
# 1. 创建新文章
hugo new posts/my-new-post.md

# 2. 编辑文章（将 draft 改为 false）
# 3. 本地预览
hugo server -D

# 4. 提交并推送
git add content/posts/my-new-post.md
git commit -m "Add new post: my-new-post"
git push

# 5. Cloudflare Pages 自动部署（1-2 分钟）
```

### 更新配置

```bash
# 1. 修改配置文件
# 2. 本地测试
hugo server

# 3. 提交更新
git add .
git commit -m "Update configuration"
git push
```

### 更新主题

```bash
# 更新 PaperMod 主题到最新版本
git submodule update --remote --merge

# 提交更新
git add themes/PaperMod
git commit -m "Update PaperMod theme"
git push
```

## 故障排除

### 构建失败

1. **检查 Hugo 版本**
   - 环境变量 `HUGO_VERSION` 是否设置正确

2. **查看构建日志**
   - Cloudflare Pages → Deployments → 点击失败的部署
   - 查看详细错误信息

3. **常见错误**
   - 主题没有正确加载：检查 `.gitmodules` 文件
   - 配置文件语法错误：本地运行 `hugo` 测试

### 评论不显示

1. **检查仓库设置**
   - 确保仓库是 Public
   - Discussions 功能已启用

2. **检查 Giscus 配置**
   - `data-repo-id` 和 `data-category-id` 是否正确
   - 仓库名格式：`username/repo`（不要加 https://）

3. **检查浏览器控制台**
   - F12 打开开发者工具
   - 查看 Console 标签是否有错误

### 样式不显示

1. **清除缓存**
   - Cloudflare Pages → Deployments
   - 点击 "Retry deployment"

2. **检查资源路径**
   - `baseURL` 配置是否正确
   - 是否使用了 `hugo --minify`

## 性能优化建议

### Cloudflare 优化

1. **启用 HTTP/3**
   - Pages 项目 → Settings → General
   - 默认已启用

2. **启用 Auto Minify**
   - Speed → Optimization
   - 勾选 HTML, CSS, JavaScript

3. **启用 Brotli**
   - 默认已启用

### SEO 优化

1. **提交站点地图**
   - Google Search Console: https://search.google.com/search-console
   - 添加属性，提交 `https://your-blog.pages.dev/sitemap.xml`

2. **验证 robots.txt**
   - 访问 `https://your-blog.pages.dev/robots.txt`
   - 确保没有阻止搜索引擎

## 备份策略

博客的所有数据都在 Git 仓库中，已经自动备份到 GitHub。

额外备份建议：

1. **评论数据**
   - 定期导出 GitHub Discussions 数据
   - 使用 GitHub API 或第三方工具

2. **统计数据**
   - Cloudflare Web Analytics 保留 6 个月
   - 如需长期保存，定期手动导出

## 成本分析

| 服务 | 费用 | 限制 |
|------|------|------|
| Cloudflare Pages | **免费** | 无限流量、500 次构建/月 |
| GitHub | **免费** | Public 仓库无限 |
| Giscus | **免费** | 基于 GitHub Discussions |
| Web Analytics | **免费** | 数据保留 6 个月 |
| **总计** | **￥0/月** | - |

升级选项（可选）：

- 自定义域名：约 ￥50-100/年（域名注册商）
- Cloudflare Pro：$20/月（更多功能）
- GitHub Pro：$4/月（私有仓库高级功能）

## 下一步

- [ ] 撰写第一篇正式文章
- [ ] 设置自定义域名
- [ ] 配置 RSS 订阅通知
- [ ] 添加友情链接页面
- [ ] 优化 SEO（提交到搜索引擎）
- [ ] 加入博客圈子或社区

---

**祝你的博客运营顺利！** 🎉

有问题可以参考：
- [Hugo 官方文档](https://gohugo.io/documentation/)
- [PaperMod Wiki](https://github.com/adityatelange/hugo-PaperMod/wiki)
- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)
