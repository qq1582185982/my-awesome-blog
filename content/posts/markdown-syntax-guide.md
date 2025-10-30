---
title: "Markdown 语法指南"
date: 2025-10-30T11:00:00+08:00
draft: false
description: "完整的 Markdown 语法示例和使用指南"
tags: ["Markdown", "教程"]
categories: ["技术"]
ShowToc: true
TocOpen: true
---

本文展示 Hugo 博客中支持的 Markdown 语法。

## 标题

```markdown
# H1 标题
## H2 标题
### H3 标题
#### H4 标题
##### H5 标题
###### H6 标题
```

## 文本样式

这是**粗体文本**。

这是*斜体文本*。

这是***粗斜体文本***。

这是~~删除线文本~~。

这是`行内代码`。

## 列表

### 无序列表

- 项目 1
- 项目 2
  - 子项目 2.1
  - 子项目 2.2
- 项目 3

### 有序列表

1. 第一项
2. 第二项
   1. 子项 2.1
   2. 子项 2.2
3. 第三项

### 任务列表

- [x] 已完成的任务
- [ ] 未完成的任务
- [ ] 待办事项

## 引用

> 这是一段引用文本。
>
> 可以包含多个段落。
>
> — 作者名

嵌套引用：

> 第一层引用
>
> > 第二层引用
> >
> > > 第三层引用

## 代码块

### Python 示例

```python
def hello_world():
    """打印 Hello World"""
    print("Hello, World!")

    # 计算斐波那契数列
    def fibonacci(n):
        if n <= 1:
            return n
        return fibonacci(n-1) + fibonacci(n-2)

    print(f"Fibonacci(10) = {fibonacci(10)}")

if __name__ == "__main__":
    hello_world()
```

### JavaScript 示例

```javascript
// ES6 箭头函数
const greet = (name) => {
  console.log(`Hello, ${name}!`);
};

// 异步函数
async function fetchData(url) {
  try {
    const response = await fetch(url);
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error:', error);
  }
}

greet('World');
```

### Go 示例

```go
package main

import (
    "fmt"
    "time"
)

func main() {
    // 并发执行
    ch := make(chan string)

    go func() {
        time.Sleep(1 * time.Second)
        ch <- "Hello from goroutine!"
    }()

    msg := <-ch
    fmt.Println(msg)
}
```

## 链接

[这是一个链接](https://example.com)

[带标题的链接](https://example.com "鼠标悬停显示")

直接链接：<https://example.com>

## 图片

```markdown
![图片描述](图片URL)
```

支持的图片格式：JPG, PNG, GIF, SVG, WebP

## 表格

| 左对齐 | 居中对齐 | 右对齐 |
|:------|:-------:|------:|
| 数据1  | 数据2   | 数据3 |
| 内容A  | 内容B   | 内容C |
| 测试X  | 测试Y   | 测试Z |

复杂表格：

| 功能 | 支持情况 | 备注 |
|-----|---------|------|
| 代码高亮 | ✅ | Chroma 引擎 |
| 表格 | ✅ | 支持对齐 |
| 数学公式 | ⚠️ | 需要额外配置 |
| 流程图 | ⚠️ | 需要 Mermaid |
| Emoji | ✅ | :smile: :heart: :rocket: |

## 分隔线

---

***

___

## 脚注

这是一段文字[^1]，后面有脚注。

这是另一个脚注[^note]。

[^1]: 这是第一个脚注的内容。
[^note]: 这是命名脚注的内容，可以包含**格式化文本**。

## 定义列表

Hugo
: 用 Go 编写的静态站点生成器

Markdown
: 轻量级标记语言

Cloudflare Pages
: 静态网站托管服务

## 缩写

HTML、CSS、JavaScript 是前端开发的基础技术。

*[HTML]: HyperText Markup Language
*[CSS]: Cascading Style Sheets

## Emoji 表情

支持 GitHub 风格的 Emoji：

- :smile: `:smile:`
- :heart: `:heart:`
- :rocket: `:rocket:`
- :thumbsup: `:thumbsup:`
- :fire: `:fire:`
- :star: `:star:`
- :checkered_flag: `:checkered_flag:`

## 警告框（需要自定义 Shortcode）

一般信息提示框可以用引用和 emoji 实现：

> ℹ️ **提示**：这是一条信息提示。

> ⚠️ **警告**：这是一条警告信息。

> ❌ **错误**：这是一条错误信息。

> ✅ **成功**：操作已成功完成。

## 键盘按键

使用 `<kbd>` 标签：

按 <kbd>Ctrl</kbd> + <kbd>C</kbd> 复制

按 <kbd>Ctrl</kbd> + <kbd>V</kbd> 粘贴

按 <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Esc</kbd> 打开任务管理器

## 高亮文本

使用 `<mark>` 标签：

这是一段包含<mark>高亮文本</mark>的句子。

## 上下标

H<sub>2</sub>O（下标）

X<sup>2</sup> + Y<sup>2</sup> = Z<sup>2</sup>（上标）

## 水平对齐

<div align="center">
  居中对齐的文本
</div>

<div align="right">
  右对齐的文本
</div>

## 折叠内容

<details>
<summary>点击展开查看详细内容</summary>

这里是折叠的内容，点击上方文字可以展开或折叠。

可以包含：
- 列表
- **格式化文本**
- `代码`

```python
print("甚至可以包含代码块！")
```

</details>

## 总结

这篇文章涵盖了 Markdown 的大部分常用语法。掌握这些语法后，你就可以轻松撰写结构清晰、格式优美的技术文章了。

更多高级用法可以参考：
- [Markdown 官方文档](https://daringfireball.net/projects/markdown/)
- [CommonMark 规范](https://commonmark.org/)
- [Hugo Markdown 指南](https://gohugo.io/content-management/formats/)

---

*Happy Writing! 📝*
