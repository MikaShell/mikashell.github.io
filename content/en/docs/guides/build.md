---
slug: "build"
title: "Build from Source"
description: ""
summary: ""
date: 2025-10-01T11:44:51+08:00
draft: false
weight: 103
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---
0. Prerequisites:

- Zig version 0.15.1 is required
- Git is required
- pkg-config is required
- esbuild is required

1. Clone the project to your local machine:

```bash
git clone https://github.com/MikaShell/mika-shell.git
```

2. Enter the project directory:

```bash
cd mika-shell
```

3. Install dependencies:

Please refer to [build ci](https://github.com/MikaShell/mika-shell/blob/b916ab3af1194782b61ee7c34c14438048f0264a/.github/workflows/build.yaml#L16) to install the required libraries on your system.

4. Start building:

```bash
zig build # Build in Debug mode by default
# or
zig build --release=fast # Build in ReleaseFast mode
```

After running the above commands, the executable will be installed into the `./zig-out/bin` directory.

If you encounter the error
`error: unable to discover remote git server capabilities: HttpConnectionClosing`,
this may indicate that your network environment cannot fetch the dependencies. Unfortunately, the current version of Zig does not support using the system network proxy ([#15048](https://github.com/ziglang/zig/issues/15048)).

Until Zig provides official support, in order to use a network proxy, you can follow the workaround mentioned in the issue: download the [zigcli](https://github.com/jiacai2050/zigcli/releases) tool, extract it, locate the `zigfetch` binary, and place it in the project directory. Then run:

```bash
chmod +x ./zigfetch
./zigfetch .
```

to fetch the dependencies, and afterwards re-run:

```bash
zig build install
```
