# 我的技术博客

使用 Hugo + PaperMod 主题 + Cloudflare Pages 搭建的个人技术博客。

## 特性

- ⚡ 极快的构建和加载速度
- 📱 完美的移动端适配
- 🌓 深色/浅色模式自动切换
- 💬 基于 GitHub Discussions 的评论系统（Giscus）
- 📊 Cloudflare Web Analytics 统计分析
- 🔍 全文搜索功能
- 📝 Markdown 完整支持
- 🎨 代码语法高亮
- 🏷️ 标签和分类
- 📰 RSS 订阅
- 🚀 自动部署

## 技术栈

| 组件 | 技术 | 说明 |
|------|------|------|
| 静态生成器 | [Hugo](https://gohugo.io/) | Go 编写，构建速度最快 |
| 主题 | [PaperMod](https://github.com/adityatelange/hugo-PaperMod) | 简洁现代的 Hugo 主题 |
| 托管平台 | [Cloudflare Pages](https://pages.cloudflare.com/) | 免费全球 CDN |
| 评论系统 | [Giscus](https://giscus.app/) | 基于 GitHub Discussions |
| 统计分析 | [Cloudflare Web Analytics](https://www.cloudflare.com/web-analytics/) | 隐私友好的统计工具 |

## 本地开发

### 前置要求

- [Hugo Extended](https://gohugo.io/installation/) v0.112.0+
- Git

### 安装

```bash
# 克隆仓库
git clone https://github.com/yourusername/my-awesome-blog.git
cd my-awesome-blog

# 拉取主题子模块
git submodule update --init --recursive

# 启动本地服务器
hugo server -D
```

访问 http://localhost:1313 预览博客。

### 创建新文章

```bash
# 创建新文章
hugo new posts/my-new-post.md

# 编辑 content/posts/my-new-post.md
# 将 draft: true 改为 draft: false 后文章会被发布
```

### 构建生成静态文件

```bash
hugo --minify
```

生成的文件在 `public/` 目录。

## 部署到 Cloudflare Pages

### 方法 1：通过 Cloudflare Dashboard（推荐）

1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com)
2. 进入 **Workers & Pages** → **Create application** → **Pages** → **Connect to Git**
3. 选择你的 GitHub 仓库
4. 配置构建设置：
   - **构建命令**：`hugo --minify`
   - **构建输出目录**：`public`
   - **环境变量**：
     - `HUGO_VERSION` = `0.121.0`（或你使用的版本）
5. 点击 **Save and Deploy**

### 方法 2：通过 Wrangler CLI

```bash
# 安装 Wrangler
npm install -g wrangler

# 登录
wrangler login

# 部署
wrangler pages publish public --project-name=my-awesome-blog
```

## 配置指南

### 配置 Giscus 评论

1. **启用 GitHub Discussions**
   - 进入仓库 Settings → Features → 勾选 Discussions

2. **安装 Giscus 应用**
   - 访问 https://github.com/apps/giscus
   - 点击 Install，选择你的仓库

3. **获取配置参数**
   - 访问 https://giscus.app/zh-CN
   - 输入仓库名：`yourusername/my-awesome-blog`
   - 复制生成的 `data-repo-id` 和 `data-category-id`

4. **更新配置**
   - 编辑 `layouts/partials/comments.html`
   - 替换 `YOUR_REPO_ID` 和 `YOUR_CATEGORY_ID`

### 配置 Cloudflare Web Analytics

1. **获取 Token**
   - 登录 Cloudflare Dashboard
   - 进入 Analytics & Logs → Web Analytics
   - 点击 "Add a site"
   - 复制生成的 token

2. **更新配置**
   - 编辑 `layouts/partials/extend_head.html`
   - 替换 `YOUR_CLOUDFLARE_TOKEN`

### 自定义配置

编辑 `hugo.toml` 修改以下内容：

```toml
baseURL = "https://your-blog.pages.dev/"  # 你的域名
title = "你的博客标题"
[params]
  author = "你的名字"
  description = "你的博客描述"
```

更新社交链接：

```toml
[[params.socialIcons]]
  name = "github"
  url = "https://github.com/yourusername"

[[params.socialIcons]]
  name = "email"
  url = "mailto:your@email.com"
```

## 目录结构

```
my-awesome-blog/
├── archetypes/          # 内容模板
│   └── post.md         # 文章模板
├── assets/             # 资源文件
│   └── css/extended/
│       └── custom.css  # 自定义样式
├── content/            # 内容目录
│   ├── posts/         # 文章
│   ├── about.md       # 关于页面
│   ├── archives.md    # 归档页面
│   └── search.md      # 搜索页面
├── layouts/            # 布局模板
│   └── partials/
│       ├── comments.html      # 评论组件
│       └── extend_head.html   # 自定义 head
├── static/             # 静态文件
│   ├── _headers       # HTTP 响应头
│   ├── _redirects     # URL 重定向
│   └── images/        # 图片资源
├── themes/
│   └── PaperMod/      # 主题文件
├── hugo.toml          # 站点配置
├── .gitignore
└── README.md
```

## 写作技巧

### Front Matter 示例

```yaml
---
title: "文章标题"
date: 2025-10-30T10:00:00+08:00
draft: false
description: "文章摘要"
tags: ["标签1", "标签2"]
categories: ["分类"]
ShowToc: true
TocOpen: false
cover:
    image: "cover.jpg"
    alt: "封面图描述"
    caption: "图片说明"
---
```

### 常用 Markdown 技巧

- 使用 `<!--more-->` 标记摘要分隔符
- 代码块使用三个反引号并指定语言
- 使用相对路径引用图片：`![描述](/images/photo.jpg)`

## 性能优化

已启用的优化：

- ✅ HTML/CSS/JS 自动压缩
- ✅ 图片懒加载
- ✅ Brotli 压缩（Cloudflare）
- ✅ HTTP/3 支持（Cloudflare）
- ✅ 资源缓存头配置
- ✅ 字体子集加载

预期性能指标：

- Lighthouse 性能分数：95+
- 首屏加载时间：< 1s
- 构建时间：< 10s

## 故障排除

### 主题不显示

```bash
git submodule update --init --recursive
```

### 本地预览找不到样式

确保使用 Hugo Extended 版本：

```bash
hugo version
# 输出应包含 "extended"
```

### 部署后评论不显示

1. 检查仓库是否为 Public
2. 确认已启用 Discussions
3. 验证 Giscus 配置参数是否正确

## 许可证

博客内容采用 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 许可。

代码部分采用 MIT 许可。

## 致谢

- [Hugo](https://gohugo.io/) - 强大的静态站点生成器
- [PaperMod](https://github.com/adityatelange/hugo-PaperMod) - 优秀的 Hugo 主题
- [Cloudflare Pages](https://pages.cloudflare.com/) - 免费的托管平台
- [Giscus](https://giscus.app/) - 优雅的评论系统

---

Made with ❤️ using Hugo and Cloudflare Pages
