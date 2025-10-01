---
title: "安装"
slug: "install"
description: ""
summary: ""
date: 2025-09-27T14:39:55+08:00
draft: false
weight: 102
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---

## Nixos

使用这个flake：

`https://github.com/MikaShell/mika-shell/blob/main/flake.nix`

在 package 中有两个软件包：`default` 和 `debug`。`default` 是以 `release-fast` 构建的,如果你遇到了问题，请尝试使用 `debug` 包，它会输出更多的调试信息。但是在某些情况下，它会比 `default` 包慢一些并且会占用更多的 CPU。

将你想要的包安装到系统上，或者通过 `nix run` 命令运行：

```bash
nix run github:MikaShell/mika-shell#debug daemon
```

## 其他发行版

非常抱歉，目前我没有更多精力为其他发行版打包，下面提供一些或许通用的手动安装步骤：

1. 首先从 [releases](https://github.com/MikaShell/mika-shell/releases) 页面下载二进制文件。
2. 确认所需的动态库依赖：

   MikaShell 使用了一些依赖库，主要是：

    ```bash
    libdbus libgtk4 webkitgtk6 libgtk4-layer-shell libwebp libinput libpng librsvg2
    ```

    不同的发行版可能有不同的库名称，请自行查找。

    如果安装了上述库仍然无法使用，可以使用`ldd` 命令查找缺失的动态库，并安装对应的包，也可以参考仓库中的 [构建ci](https://github.com/MikaShell/mika-shell/blob/b916ab3af1194782b61ee7c34c14438048f0264a/.github/workflows/build.yaml#L16) 中所填写的库依赖。
