---
slug: "get-started"
title: "Get Started"
description: "An introduction to what MikaShell is and what it can do."
summary: "MikaShell is an open-source desktop shell building tool that runs in a Wayland environment."
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
This guide will walk you through the installation, configuration, and usage of MikaShell to help you get started quickly.

## What is MikaShell?

MikaShell is an open-source desktop shell building tool that runs in a Wayland environment.
Built on top of `Gtk4` and `WebkitGtk6`, it enables you to quickly create beautiful, efficient, and user-friendly desktop environments.

## What does MikaShell do?

MikaShell displays HTML pages as `Layer` or `Window` objects in a Wayland environment and provides access to certain interfaces required to build “desktop components” (for example: system tray, workspaces, etc.).
These interfaces might be implemented via dbus or more complex calls, and MikaShell provides `JS/TS` bindings for the front end.
