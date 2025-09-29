---
slug: "new-projct"
title: "新建项目"
description: ""
summary: ""
date: 2025-09-29T11:30:42+08:00
draft: false
weight: 203
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---
mika-shell 所使用的载体是前端资源，支持原生 HTML 和 React/Vue/Angular/Svelte 等前端框架构建的资源。

## 通过原生 HTML 创建项目

只需要在配置文件夹中直接编写 html 文件，请参考 [example](https://github.com/MikaShell/mika-shell/tree/main/example)。

通过 `globalThis.mikaShell` 可以访问 mika-shell 提供的功能。

## 通过前端框架创建项目

比起直接编写 html 和 js，通过 Vue 等前端框架创建项目要复杂得多，但也带来了许多便利。本节将介绍如何使用前端框架创建一个新项目，并使用 mika-shell 进行调试。在调试时，推荐使用 Debug 构建的 mika-shell。

只需要像创建一个普通的前端项目那样通过你喜欢的方式创建一个项目，然后创建一个文件夹，例如 `mika-shell-config` 文件夹，在其中创建一个 `config.json` 文件，内容参考：

```json
{
    "dev": {
        "my-mika-shell": "http://localhost:5173/"
    },
    "startup": ["/my-mika-shell/index.html"]
}
```

其中的 `"http://localhost:5173/"` 请修改为实际的 URL。

为了让 `mika-shell daemon` 命令使用这个配置，可以通过 `mika-shell daemon -c <dir>` 或环境变量 `MIKASHELL_CONFIG_DIR` 来指定配置文件夹。

你也可以在 `public` 文件夹中创建 `alias.json` 文件来配置别名。
