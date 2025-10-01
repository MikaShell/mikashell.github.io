---
slug: "modules"
title: "Modules"
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

Modules refer to the features provided by mika-shell.
This section explains how to use these features within a frontend project.
There is a separate chapter covering the capabilities of each module in detail.

## Native HTML

You can call modules on the `globalThis.mikaShell` object:

```javascript
mikaShell.os.getSystemInfo().then(info => {
  console.log(info);
})
```

## Using TypeScript

In TypeScript, you can still call modules through the `globalThis.mikaShell` object,
but there is a better approach.

Install the `@mika-shell/core` and optional `@mika-shell/extra` packages via npm or another package manager:

```bash
npm install @mika-shell/core @mika-shell/extra
```

{{< callout type="warning" >}}
Since this is still in the testing phase, the npm package may be outdated. Please get the latest version from [Releases](https://github.com/MikaShell/mika-shell/releases)!!!

```bash
npm install https://github.com/MikaShell/mika-shell/releases/download/latest/mika-shell-core-xxx.tgz
npm install https://github.com/MikaShell/mika-shell/releases/download/latest/mika-shell-extra-xxx.tgz
```

{{< /callout >}}

* `@mika-shell/core` includes everything in `globalThis.mikaShell`.
  In fact, `@mika-shell/core` mainly provides type definitions.
* `@mika-shell/extra` builds on `@mika-shell/core` and offers additional modules such as `hyprland`.

## What’s Next?

Check the [example](https://github.com/MikaShell/mika-shell/tree/main/example) for more inspiration.

In the example, you may see `globalThis.mikaShell` or `window.mikaShell`.
If you’re using TypeScript, you can also import modules like this:

```typescript
import { os } from '@mika-shell/core';
```

This is equivalent to:

```javascript
const os = globalThis.mikaShell.os;
// or
const os = window.mikaShell.os;
// or
const os = mikaShell.os;
```

{{< callout type="warning" >}}
All module calls provided by mika-shell are *asynchronous*,
so you need to use `async/await` or `.then()` to get results.
Keep this in mind at all times.
{{< /callout >}}
