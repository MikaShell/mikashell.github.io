---
title: "Installation"
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

Use this flake:

`https://github.com/MikaShell/mika-shell/blob/main/flake.nix`

There are two packages in the package: `default` and `debug`. `default` is built with `release-fast`.
If you encounter problems, try using the `debug` package, which outputs more debugging information.
However, in some cases it may run slower than the `default` package and consume more CPU.

## Other Distributions

Sorry, I currently don’t have the energy to package for other distributions.
Below are some general manual installation steps you can follow:

1. First, download the binary from the [releases](https://github.com/MikaShell/mika-shell/releases) page.
2. Confirm the required dynamic library dependencies:

   MikaShell uses several dependency libraries, mainly:

    ```bash
    libdbus libgtk4 webkitgtk6 libgtk4-layer-shell libwebp libinput libpng librsvg2
    ```

    Different distributions may have different library names, so please check accordingly.

    If the application still doesn’t work after installing the libraries above, you can use the `ldd` command to find missing dynamic libraries and install the corresponding packages.
    You can also refer to the [build CI](https://github.com/MikaShell/mika-shell/blob/b916ab3af1194782b61ee7c34c14438048f0264a/.github/workflows/build.yaml#L16) in the repository for the listed library dependencies.
