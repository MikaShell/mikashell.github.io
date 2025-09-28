---
slug: "config"
title: "配置文件"
description: ""
summary: ""
date: 2025-09-28T14:08:27+08:00
draft: false
weight: 201
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---
在开始讲解配置文件之前，我们先来了解一些重要的概念。

mika-shell 将网页（html）显示到桌面上，所以我们首先得有用于显示 html 文件。将 html/js/css 文件存放到配置文件夹中，mika-shell daemon 会启动内置的 web 服务器，当要显示一个页面时，mika-shell 首先会创建一个 webview，类似于浏览器的新标签页，然后 webview 会通过自定义的协议加载网页所需要的文件，这与普通浏览器通过 http 请求访问网页的过程类似。

配置文件默认存放在 `$HOME/.config/mika-shell/` 文件夹中，可以通过环境变量 `$MIKASHELL_CONFIG_DIR` 来指定配置文件的存放位置。

配置文件的名称为 `config.json`，一个简单的示例如下：

```json
{
    "alias": {
        "bongocat": "/example/bongocat.html"
    },
    "startup": ["example.bar", "example.dock"],
    "services": ["notifd.added:/notify.html"]
}
```

以上的片段来自 Github 仓库中的 [example](https://github.com/MikaShell/mika-shell/tree/main/example)，你可以从仓库中观察其目录结构。本节的内容都基于这个示例。

## Alias

`alias` 字段用于设置别名，在打开页面的时候起作用。通过给一个网页路径设置别名，你就可以通过简短的别名来打开对应网页，而不是使用冗长且不便于拼写的 url。

例如 `mika-shell open <name>` 命令的作用是打开一个页面，其中的 name 可以是 alias 名称，也可以是完整的网页路径。区分这两者的唯一依据是，如果 name 以 `/` 开头，那么它就是一个路径。反之，如果 name 不以 `/` 开头，那么它就是一个 alias。使用 alias 时，mika-shell 会在配置文件中查找对应的路径。

## Startup

`startup` 字段用于设置 mika-shell 启动时自动打开的页面。它是一个"字符串列表"，列表中的每个元素都是一个页面的名称，这些页面可以是 alias 名称，也可以是完整的网页路径。

## Services

`services` 字段用于设置 mika-shell 运行时注册的服务。它是一个"字符串列表"，其中的每一项格式为 `<event-name>:<page>`，其中 `evebt-name` 是 mika-shell 事件的名称，`page` 是要打开的页面的名称（alias 名称或完整的网页路径）。

当所设定的事件发生时，会自动打开指定的页面并且将事件的数据通过 `query string` 传递给页面。事件的数据可以在网页中通过 js 代码获取：

```javascript
const data = new URLSearchParams(window.location.search).get('data')
```

在注册的页面被事件打开之后，直到目标页面关闭之前，这个 service 不会再被触发。

`event-name` 可以在这里找到：[事件列表](https://github.com/MikaShell/mika-shell/blob/main/src/events.zig#L2)。

## 组合多个前端

你可能注意到了配置文件中的 `"example.bar"` 和 `"/notify.html"`，这是表示一个页面的另一种写法。

在配置文件夹中的每一个文件夹都被认为是各自独立的前端项目，如果需要组合多个前端项目，只需要将其放入配置文件夹中。然而在 `config.json` 中为每一个前端项目添加 alias 太麻烦了！所以，可以在前端项目文件夹中添加一个 `alias.json` 文件，这个文件用于设定这个前端项目的别名。在 `config.json` 中可以以 `<folder>.<alias>` 的格式表示 folder 中的页面。

例如在 example 中，`alias.json` 如下：

```json
{
    "debug": "/debug/index.html",
    "bar": "/bar.html",
    "dock": "/dock.html",
    "showkeys": "/showkeys.html",
    "bongocat": "/bongocat.html"
}
```

其中 `"bar": "/bar.html"` 实际的文件路径是 `"/example/bar.html"`，`"/"` 是以配置文件所在目录为根目录。而在 `alias.json` 中填写时，需要以 `example` 文件夹为根目录，所以写作 `"/bar.html"`。

你也可以不使用别名，而直接写出完整的网页路径，如 `"/example/bar.html"`。或者在 `config.json` 中重新为这个路径分配新的别名，例如可以在 `config.json` 这么写：

```json
{
    "alias": {
        "bar": "/example/bar.html"
    },
}
```
