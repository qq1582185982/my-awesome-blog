---
title: "欢迎来到我的技术博客"
date: 2025-10-30T10:00:00+08:00
draft: false
description: "博客搭建完成，分享技术栈和搭建过程"
tags: ["博客", "Hugo", "Cloudflare"]
categories: ["随笔"]
ShowToc: true
TocOpen: false
---

## 博客上线了！

经过一番折腾，终于用 Hugo + Cloudflare Pages 把个人博客搭建起来了。这篇文章记录一下搭建过程和技术选型。

## 为什么选择这个技术栈？

### Hugo - 速度之王

Hugo 是用 Go 语言编写的静态站点生成器，最大的优势就是**快**：

- 构建速度极快，1000 篇文章只需几秒
- 单文件二进制，安装简单
- 主题丰富，生态成熟

对比其他工具：

| 工具 | 语言 | 构建速度 | 学习曲线 |
|------|------|----------|---------|
| Hugo | Go | ⚡⚡⚡ | ⭐⭐ |
| Hexo | Node.js | ⚡⚡ | ⭐⭐⭐ |
| Jekyll | Ruby | ⚡ | ⭐⭐⭐⭐ |
| VitePress | Vue | ⚡⚡ | ⭐⭐⭐ |

### Cloudflare Pages - 免费且强大

选择 Cloudflare Pages 作为托管平台的理由：

1. **完全免费**：无限流量，无限构建次数
2. **全球 CDN**：访问速度快
3. **自动部署**：git push 后自动构建上线
4. **免费 SSL**：自动签发证书
5. **配套服务**：Web Analytics、Workers 等

### PaperMod 主题

这个主题的特点：

- 简洁现代的设计
- 深色/浅色模式切换
- 移动端适配良好
- 搜索功能内置
- 性能优化到位

## 博客功能

目前已经集成的功能：

- ✅ 文章发布和归档
- ✅ 标签和分类
- ✅ 全文搜索
- ✅ RSS 订阅
- ✅ 评论系统（Giscus）
- ✅ 统计分析（Cloudflare Web Analytics）
- ✅ 代码高亮
- ✅ 响应式设计

## 搭建过程

### 1. 初始化项目

```bash
# 安装 Hugo
winget install Hugo.Hugo.Extended

# 创建新站点
hugo new site my-awesome-blog
cd my-awesome-blog

# 安装主题
git init
git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
```

### 2. 配置站点

编辑 `hugo.toml`，配置基本信息和主题参数。

### 3. 部署到 Cloudflare Pages

1. 推送代码到 GitHub
2. 在 Cloudflare Dashboard 创建 Pages 项目
3. 连接 GitHub 仓库
4. 配置构建命令：`hugo --minify`
5. 等待自动部署完成

整个过程不到 10 分钟！

## 后续计划

接下来打算做的事情：

- [ ] 添加更多技术文章
- [ ] 优化 SEO（提交站点地图到搜索引擎）
- [ ] 添加自定义域名
- [ ] 实现自动化备份
- [ ] 探索 Cloudflare Workers 的更多玩法

## 写在最后

这个博客将会用来记录技术学习和项目经验。如果你也想搭建类似的博客，欢迎参考我的配置。

有任何问题欢迎在下方评论区留言交流！

---

*本文使用 Hugo 编写，托管于 Cloudflare Pages*
