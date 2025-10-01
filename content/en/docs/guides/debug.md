---
slug: "debug"
title: "Debugging"
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
Before starting the debugging steps, please make sure the project has been built successfully.

The following describes how to debug using VSCode.

1. Install the **lldb** command
2. Edit `task.json`:

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

3. Edit `launch.json`:

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

After completing the above steps, open the Debug panel in VSCode, select **Debug Launch**, and start debugging.
