---
slug: "other-dependencies"
title: "其他依赖"
description: ""
summary: ""
date: 2025-09-27T17:22:58+08:00
draft: false
weight: 104
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---
某些情况下，Webview 的一些功能可能没法发挥作用，例如播放视频，播放声音等。这些功能可能需要安装额外的 GStreamer 插件。

对于 Nixos, 可能需要如下软件包：

```nix
  gst_all_1.gst-plugins-base
  gst_all_1.gst-plugins-good
  gst_all_1.gst-plugins-bad
  gst_all_1.gst-plugins-ugly
  gst_all_1.gst-libav
  gst_all_1.gstreamer
```

其他发行版应该大同小异。请注意，这些软件包并不需要全部安装，只需安装那些用于支持你需要的功能的插件即可。当然如果你不知道自己需要的功能依赖哪个插件，那就安装全部的插件吧。

如果你想知道系统中安装了哪些 GStreamer 插件，可以检查 `GST_PLUGIN_SYSTEM_PATH_1_0` 环境变量。

在安装好 mika-shell 后，执行 `mika-shell` 命令会打印出一些帮助。
