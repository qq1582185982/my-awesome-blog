# 快速开始指南

## 本地开发

### 启动本地服务器

**方法 1：使用批处理脚本**
```
双击 "启动本地服务器.bat"
```

**方法 2：命令行**
```bash
hugo server -D
```

访问 http://localhost:1313 查看博客。

### 创建新文章

```bash
hugo new posts/my-article.md
```

文件会创建在 `content/posts/my-article.md`，编辑它：

```markdown
---
title: "我的新文章"
date: 2025-10-30T10:00:00+08:00
draft: false  # 改为 false 以发布
description: "文章简介"
tags: ["标签1", "标签2"]
categories: ["分类"]
---

这里写正文内容...
```

### 构建静态文件

```bash
hugo --minify
```

生成的文件在 `public/` 目录。

## 配置修改

### 修改博客信息

编辑 `hugo.toml`：

```toml
baseURL = "https://your-blog.pages.dev/"
title = "你的博客标题"

[params]
  author = "你的名字"
  description = "你的博客描述"
```

### 修改社交链接

编辑 `hugo.toml`：

```toml
[[params.socialIcons]]
  name = "github"
  url = "https://github.com/yourusername"
```

支持的图标：github, twitter, email, rss, linkedin, stackoverflow 等。

### 配置评论系统

1. 启用 GitHub Discussions
2. 访问 https://giscus.app/zh-CN 获取配置
3. 编辑 `layouts/partials/comments.html`
4. 替换 `YOUR_REPO_ID` 和 `YOUR_CATEGORY_ID`

### 配置统计分析

编辑 `layouts/partials/extend_head.html`，替换：
```html
data-cf-beacon='{"token": "YOUR_CLOUDFLARE_TOKEN"}'
```

或在 Cloudflare Pages 中启用 "Automatic setup"。

## 常用命令

| 命令 | 说明 |
|------|------|
| `hugo server -D` | 启动开发服务器（包含草稿） |
| `hugo server` | 启动开发服务器（不含草稿） |
| `hugo new posts/title.md` | 创建新文章 |
| `hugo --minify` | 构建生产版本 |
| `hugo --buildDrafts` | 构建包含草稿 |
| `hugo version` | 查看 Hugo 版本 |

## 文章 Front Matter 参考

```yaml
---
title: "文章标题"                    # 必填
date: 2025-10-30T10:00:00+08:00    # 必填
draft: false                         # true=草稿 false=发布

# 可选字段
description: "文章简介"              # SEO 和社交分享
summary: "自定义摘要"                # 如不设置则自动生成
tags: ["标签1", "标签2"]            # 标签
categories: ["分类"]                 # 分类
author: "作者名"                     # 作者

# 显示设置
ShowToc: true                        # 显示目录
TocOpen: false                       # 目录默认展开
ShowReadingTime: true                # 显示阅读时间
ShowWordCount: true                  # 显示字数
ShowBreadCrumbs: true                # 显示面包屑导航
comments: true                       # 启用评论

# 封面图
cover:
    image: "cover.jpg"               # 图片路径（相对于 static/）
    alt: "图片描述"                  # 替代文本
    caption: "图片说明"              # 图片标题
    relative: false                  # 是否相对路径

# SEO 设置
keywords: ["关键词1", "关键词2"]
canonicalURL: "https://example.com/post/"
---
```

## 常见任务

### 添加图片

1. 将图片放到 `static/images/` 目录
2. 在文章中引用：
```markdown
![图片描述](/images/photo.jpg)
```

### 添加代码块

````markdown
```python
def hello():
    print("Hello, World!")
```
````

### 添加引用

```markdown
> 这是一段引用
```

### 添加表格

```markdown
| 列1 | 列2 | 列3 |
|-----|-----|-----|
| 数据 | 数据 | 数据 |
```

### 添加链接

```markdown
[链接文字](https://example.com)
```

## Git 操作

### 首次推送

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/yourusername/my-awesome-blog.git
git push -u origin main
```

### 日常更新

```bash
git add .
git commit -m "描述你的更改"
git push
```

### 常用提交信息

- `Add new post: 文章标题`
- `Update post: 文章标题`
- `Fix typo in 文章标题`
- `Update site configuration`
- `Add new feature: 功能描述`
- `Update theme`

## 目录结构速查

```
my-awesome-blog/
├── content/              # 内容目录
│   ├── posts/           # 文章（主要编辑这里）
│   ├── about.md         # 关于页面
│   ├── search.md        # 搜索页面
│   └── archives.md      # 归档页面
│
├── static/              # 静态文件
│   └── images/         # 图片（放这里）
│
├── layouts/partials/    # 自定义布局
│   ├── comments.html   # 评论配置
│   └── extend_head.html # 自定义 head
│
├── assets/css/extended/ # 自定义样式
│   └── custom.css      # CSS 样式（可编辑）
│
├── hugo.toml           # 主配置文件（常改）
└── themes/PaperMod/    # 主题（不要直接修改）
```

## 问题排查

### 样式没有生效
```bash
# 清除缓存重新构建
hugo --cleanDestinationDir --minify
```

### 主题没有加载
```bash
# 更新主题子模块
git submodule update --init --recursive
```

### 文章不显示
- 检查 `draft: false` 是否设置
- 检查日期是否是未来时间
- 使用 `hugo server -D` 可以看到草稿

### 评论不显示
1. 检查仓库是否 Public
2. 检查 Discussions 是否启用
3. 检查配置参数是否正确

## 学习资源

- **Hugo 文档**：https://gohugo.io/documentation/
- **PaperMod 主题文档**：https://github.com/adityatelange/hugo-PaperMod/wiki
- **Markdown 语法**：https://www.markdownguide.org/
- **Cloudflare Pages**：https://developers.cloudflare.com/pages/

## 获取帮助

遇到问题？

1. 查看 `README.md` - 完整使用说明
2. 查看 `DEPLOYMENT.md` - 部署指南
3. 搜索 Hugo/PaperMod 文档
4. 在 GitHub Issues 提问

---

**Happy Blogging! 📝✨**
