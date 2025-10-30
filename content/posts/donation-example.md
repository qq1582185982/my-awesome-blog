---
title: "图片插入演示"
date: 2025-10-30T18:00:00+08:00
draft: false
description: "实际演示如何在文章中插入图片"
tags: ["演示"]
categories: ["教程"]
---

## 这是一个图片插入演示

下面展示如何在文章中插入图片：

### 方法 1：基础 Markdown 语法

![支付二维码](/images/payment-qr.png)

### 方法 2：带标题的图片

![支付二维码](/images/payment-qr.png "扫码支持")

### 方法 3：指定宽度的图片

<img src="/images/payment-qr.png" alt="支付二维码" width="400" />

### 方法 4：居中显示

<div style="text-align: center;">
  <img src="/images/payment-qr.png" alt="支付二维码" width="400" />
  <p><em>扫码支持，感谢！</em></p>
</div>

---

就是这么简单！只需要：

1. 将图片放到 `static/images/` 目录
2. 在文章中用 `/images/图片名.png` 引用
3. 发布文章

图片会自动在文章中显示。
