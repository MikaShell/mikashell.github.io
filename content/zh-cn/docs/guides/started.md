---
slug: "get-started"
title: "开始"
description: "介绍 MikaShell 是什么以及它能做什么。"
summary: "MikaShell 是一款在 Wayland 环境下运行的开源的桌面 shell 构建工具。"
date: 2025-09-26T14:43:11+08:00
draft: false
weight: 101
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---
本指南将引导您完成 MikaShell 的安装、配置、使用等流程，以帮助您快速上手 MikaShell。

## 什么是 MikaShell ？

MikaShell 是一款在 Wayland 环境下运行的开源的桌面 shell 构建工具。基于 `Gtk4` 和 `WebkitGtk6` 构建，它可以让你快速地创建出漂亮、高效、易用的桌面环境。

## MikaShell 做了什么？

MikaShell 将 html 页面以 `Layer` 或 `Window` 的形式显示在 Wayland 环境中，并使其能够访问部分构建"桌面组件"所需的一些接口（例如：系统托盘，工作区等）。这些接口可能以 dbus 或者更复杂的调用实现，MikaShell 为前端提供 `JS/TS` 绑定。
