---
slug: "modules"
title: "模块"
description: ""
summary: ""
date: 2025-09-29T12:41:25+08:00
draft: false
weight: 204
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---

模块是指由 mika-sehll 提供的功能，本章节介绍如何在前端项目中使用 mika-shell 提供的功能。关于模块的功能我们有单独的章节讲解。

## 原生 Html

你可以在 `globalThis.mikaShell` 对象上调用模块。

```javascript
mikaShell.os.getSystemInfo().then(info => {
  console.log(info);
})
```

## 使用 TypeScript

在 TypeScript 中，你仍然可以通过 `globalThis.mikaShell` 对象调用模块，但我们有更好的方式。

通过 npm 或者其他包管理器安装 `@mika-shell/core` 和 `@mika-shell/extra`（可选）包：

```bash
npm install @mika-shell/core @mika-shell/extra
```

{{< callout type="warning" >}}
由于目前正在测试阶段，npm 的包可能过时，请优先从 [Releases](https://github.com/MikaShell/mika-shell/releases) 获取最新版本的包！！！
{{< /callout >}}

其中 `@mika-shell/core` 中包含了 `globalThis.mikaShell` 的所有内容，实际上 `@mika-shell/core` 仅作为类型提示。

而 `@mika-shell/extra` 是基于 `@mika-shell/core` 开发了一些额外的模块，如 `hyprland` 等。

## 接下来是什么？

请查看 [example](https://github.com/MikaShell/mika-shell/tree/main/example) 来获得更多灵感。

在 example 中，你可能会看到 `globalThis.mikaShell` 或者 `window.mikaShell`。如果你使用 TypeScript，你也可以使用 `import { xxx } from '@mika-shell/core';` 来导入对应的模块。例如以下 TypeScript 代码：

```typescript
import { os } from '@mika-shell/core';
```

等价于：

```javascript
const os = globalThis.mikaShell.os;
// or
const os = window.mikaShell.os;
// or
const os = mikaShell.os;
```

{{< callout type="warning" >}}
mika-shell 提供的模块调用都是 *异步* 的，所以你需要使用 `async/await` 或 `.then()` 来获取结果，请时刻注意这一点。
{{< /callout >}}
