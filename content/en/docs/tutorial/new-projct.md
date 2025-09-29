---
slug: "new-projct"
title: "Create a New Project"
description: ""
summary: ""
date: 2025-09-29T11:30:42+08:00
draft: false
weight: 203
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---
mika-shell uses frontend assets as its foundation and supports both native HTML and resources built with frameworks such as React, Vue, Angular, and Svelte.

## Create a Project with Native HTML

Simply write HTML files directly in the configuration folder.
Refer to the [example](https://github.com/MikaShell/mika-shell/tree/main/example).

You can access mika-shell features through `globalThis.mikaShell`.

## Create a Project with a Frontend Framework

Compared to writing plain HTML and JavaScript, creating a project with a framework like Vue is more complex but provides many conveniences.
This section explains how to create a new project using a frontend framework and debug it with mika-shell.
When debugging, it’s recommended to use the Debug build of mika-shell.

Create a project as you normally would with your preferred frontend setup.
Then create a folder—e.g., `mika-shell-config`—and inside it create a `config.json` file, for example:

```json
{
    "dev": {
        "my-mika-shell": "http://localhost:5173/"
    },
    "startup": ["/my-mika-shell/index.html"]
}
```

Replace `"http://localhost:5173/"` with the actual URL.

To let the `mika-shell daemon` command use this configuration, specify the configuration folder with
`mika-shell daemon -c <dir>` or set the `MIKASHELL_CONFIG_DIR` environment variable.

You can also create an `alias.json` file in the `public` folder to configure aliases.
