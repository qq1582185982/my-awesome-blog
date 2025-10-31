---
title: "图片使用示例"
date: 2025-10-30T17:00:00+08:00
draft: false
description: "演示如何在博客文章中添加图片"
tags: ["教程", "Hugo"]
categories: ["技术"]
ShowToc: true
---

## 基础图片插入

### 方法 1：Markdown 语法

最简单的方式：

![示例图片](https://picsum.photos/800/600)

### 方法 2：带标题的图片

![示例图片](https://picsum.photos/800/600?random=1 "这是鼠标悬停时显示的标题")

### 方法 3：Hugo Figure Shortcode

使用 Hugo 的 figure shortcode 可以添加更多功能：

{{< figure src="https://picsum.photos/600/400?random=2" alt="图片描述" caption="这是图片说明文字" width="600" >}}

## 图片大小控制

### 使用 HTML（更灵活）

<img src="https://picsum.photos/800/600?random=3" alt="示例" width="400" />

### 使用内联样式

<img src="https://picsum.photos/800/600?random=4" alt="示例" style="width: 500px; height: auto;" />

## 多图并排显示

<div style="display: flex; gap: 10px; flex-wrap: wrap;">
  <img src="https://picsum.photos/300/200?random=5" alt="图片1" width="300" />
  <img src="https://picsum.photos/300/200?random=6" alt="图片2" width="300" />
</div>

## 外部图片链接

也可以直接引用外部图片：

![外部图片](https://picsum.photos/600/400?random=7)

## 图片优化建议

1. **使用合适的格式**：
   - 照片 → JPG
   - 图标/插图 → PNG
   - 动画 → GIF
   - 现代浏览器 → WebP

2. **压缩图片**：
   - 使用工具如 TinyPNG 压缩图片
   - 保持文件大小在 200KB 以下

3. **命名规范**：
   - 使用英文和连字符
   - 例如：`blog-post-header.jpg`

4. **图片尺寸**：
   - 全宽图片：1200px
   - 内容图片：800px
   - 缩略图：400px

## 封面图片

在文章的 Front Matter 中设置封面图：

```yaml
---
title: "文章标题"
cover:
    image: "/images/cover.jpg"
    alt: "封面图描述"
    caption: "封面图说明"
---
```

这样封面图会显示在文章顶部和列表页的缩略图中。
