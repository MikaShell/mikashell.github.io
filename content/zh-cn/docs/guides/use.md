---
slug: "use"
title: "使用"
description: ""
summary: ""
date: 2025-09-27T20:11:40+08:00
draft: false
weight: 105
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---

## 数据存储

如果你因为某些原因需要清除 mika-shell 产生的数据，知道这些这会有很有帮助。

- `$XDG_CONFIG_HOME/mika-shel` 是存放配置文件以及前端文件的目录。或者你会更熟悉这个目录：`$HOME/.config/mika-shell`

- `$XDG_DATA_HOME/webkitgtk/` 是存放 Webview 数据的目录，网页产生的数据将会保存到此处，例如缓存、Cookie、localStorage等。或者你会更熟悉这个目录： `$HOME/.local/share/webkitgtk/`

- `$XDG_CACHE_HOME/webkitgtk/` 是存放 Webview 缓存的目录，缓存文件将会保存到此处。或者你会更熟悉这个目录： `$HOME/.cache/webkitgtk/`

- mika-shell 还会在 `/tmp` 目录中创建类似 `/tmp/mika-shell-xxxx.sock` 的文件用于 IPC。

{{< callout type="warning" >}}
`$HOME/.local/share/webkitgtk/` 和 `$HOME/.local/share/webkitgtk/` 在未来可能会更改为更容易辨识的目录，例如 `$HOME/.local/share/mika-shell/`
{{< /callout >}}

## 运行

你可以执行 `mika-shell -h` 获取更多的命令行帮助。

执行以下命令启动 mika-shell：

```bash
mika-shell daemon
```

如果配置文件目录不存在，则会在运行 `mika-shell daemon` 之后自动创建 [默认的配置文件](https://github.com/MikaShell/mika-shell/tree/main/example)。如果一切正常，那么你应该可以看到一个简单的 bar 出现在屏幕顶部。你可以在点击 bar 左侧的 Debug 按钮查看更多示例，鼠标右键可以打开网页调试工具。

初始配置主要是目的是用于开发测试以及功能探索，并不适合日常使用。下一章节我将介绍如何从头打造属于你自己的配置。
