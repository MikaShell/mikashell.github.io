---
slug: "build"
title: "从源代码构建"
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
0. 前提条件：

- 需要安装 Zig 0.15.1 版本
- 需要安装 Git
- 需要安装 pkg-config
- 需要安装 esbuild

1. 克隆项目到本地：

```bash
git clone https://github.com/MikaShell/mika-shell.git
```

2. 进入项目目录：

```bash
cd mika-shell
```

3. 安装依赖：

请参考 [构建ci](https://github.com/MikaShell/mika-shell/blob/b916ab3af1194782b61ee7c34c14438048f0264a/.github/workflows/build.yaml#L16) 在系统上安装依赖库。

4. 开始构建：

```bash
zig build # 默认以 Debug 模式构建
# 或者
zig build --release=fast # 以 ReleaseFast 模式构建
```

执行上述命令后，会将可执行文件安装到 `./zig-out/bin` 目录中。

如果构建命令出现 `rror: unable to discover remote git server capabilities: HttpConnectionClosing` 错误，这可能意味着你所在的网络环境无法获取依赖。遗憾的是目前版本的 zig 没法使用系统上的网络代理（[#15048](https://github.com/ziglang/zig/issues/15048)）。

在 zig 提供支持之前，为了使用网络代理，按照上述 issue 提供的解决方案，可以下载 [zigcli](https://github.com/jiacai2050/zigcli/releases) 工具，解压后找到 `zigfetch` 并将其放到项目目录下。执行：

```bash
chmod +x ./zigfetch
./zigfetch .
```

命令来获取依赖，之后重新执行：

```bash
zig build install
```
