---
slug: "other-dependencies"
title: "Other Dependencies"
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
In some cases, certain Webview features may not work properly, such as playing videos or audio.
These features may require additional GStreamer plugins to be installed.

For Nixos, you may need the following packages:

```nix
  gst_all_1.gst-plugins-base
  gst_all_1.gst-plugins-good
  gst_all_1.gst-plugins-bad
  gst_all_1.gst-plugins-ugly
  gst_all_1.gst-libav
  gst_all_1.gstreamer
```

Other distributions should be similar.
Please note that you don’t need to install all of these packages—only those plugins that support the features you need.
Of course, if you’re unsure which plugin a feature depends on, you can just install all of them.

If you want to know which GStreamer plugins are installed on your system, you can check the `GST_PLUGIN_SYSTEM_PATH_1_0` environment variable.

After installing mika-shell, running the `mika-shell` command will print some helpful information.
