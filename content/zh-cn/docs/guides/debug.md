---
slug: "debug"
title: "调试"
description: ""
summary: ""
date: 2025-10-01T13:10:56+08:00
draft: false
weight: 106
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---
在开始调试步骤之前，请先完成构建工作。

接下来介绍如何使用 VSCode 进行调试。

1. 安装 **lldb** 命令
2. 编辑 `task.json`：

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build",
            "type": "shell",
            "command": "zig build",
            "problemMatcher": [],
            "group": {
                "kind": "build",
                "isDefault": true
            }
        }
    ]
}
```

3. 编辑 `launch.json`：

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug Launch",
            "type": "lldb",
            "request": "launch",
            "program": "${workspaceFolder}/zig-out/bin/mika-shell",
            "args": ["daemon"],
            "cwd": "${workspaceFolder}",
            "preLaunchTask": "build",
            "initCommands": ["process handle -p true -s false -n false SIGUSR1"]
        }
    ]
}
```

完成上述步骤后，在 VSCode 中的调试面板中，选择 **Debug Launch** 进行调试。
