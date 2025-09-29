---
slug: "config"
title: "Configuration File"
description: ""
summary: ""
date: 2025-09-28T14:08:27+08:00
draft: false
weight: 202
toc: true
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  noindex: false # false (default) or true
---
Before explaining the configuration file, let’s first understand some important concepts.

mika-shell displays web pages (HTML) on the desktop, so we first need HTML files to display.
Place your HTML/JS/CSS files in the configuration folder.
The `mika-shell daemon` will start a built-in web server.
When a page needs to be displayed, mika-shell creates a WebView—similar to a new browser tab—then the WebView loads the required files using a custom protocol, much like how a regular browser uses HTTP requests.

By default, the configuration files are stored in the `$HOME/.config/mika-shell/` folder.
You can override this location with the environment variable `$MIKASHELL_CONFIG_DIR`.

The configuration file name is `config.json`.
A simple example:

```json
{
    "dev": {
        "vite-server": "http://localhost:5173/"
    },
    "alias": {
        "bongocat": "/example/bongocat.html"
    },
    "startup": ["example.bar", "example.dock"],
    "services": ["notifd.added:/notify.html"]
}
```

This snippet comes from the [example](https://github.com/MikaShell/mika-shell/tree/main/example) in the GitHub repository, and the content here is based on that example.

Many paths in the configuration start with `"/"`, which are relative to the root of the configuration directory.

## Alias

The `alias` field sets up shortcuts for opening pages.
By assigning an alias to a web page path, you can open the page using a short name instead of a long, hard-to-type URL.

For example, the command `mika-shell open <name>` opens a page where `<name>` can be either an alias or a full path.
If `<name>` starts with `/`, it’s treated as a path; otherwise, it’s an alias.
When using an alias, mika-shell looks up the corresponding path in the configuration file.

## Startup

The `startup` field specifies which pages mika-shell should automatically open at launch.
It’s a list of strings, where each item is a page name—either an alias or a full path.

## Services

The `services` field defines services to be registered while mika-shell is running.
It’s a list of strings in the format `<event-name>:<page>`, where `event-name` is the name of a mika-shell event and `page` is the page to open (alias or full path).

When the specified event occurs, the given page is opened and the event’s data is passed to the page via a query string.
You can access the data in JavaScript like this:

```javascript
const data = new URLSearchParams(window.location.search).get('data')
```

Once the registered page is opened by the event, that service will not trigger again until the page is closed.

You can find valid `event-name` values here: [Event List](https://github.com/MikaShell/mika-shell/blob/main/src/events.zig#L2).

## Combining Multiple Frontends

You may have noticed entries like `"example.bar"` and `"/notify.html"` in the configuration—these are alternative ways to reference a page.

Each folder inside the configuration directory is treated as an independent frontend project.
To combine multiple frontend projects, simply place them inside the configuration folder.
However, adding aliases for every project directly in `config.json` can be tedious.
To simplify this, you can add an `alias.json` file inside each frontend project folder to define aliases for that project.
Then in `config.json`, you can reference pages as `<folder>.<alias>`.

For example, in the `example` folder, the `alias.json` looks like this:

```json
{
    "debug": "/debug/index.html",
    "bar": "/bar.html",
    "dock": "/dock.html",
    "showkeys": "/showkeys.html",
    "bongocat": "/bongocat.html"
}
```

Here `"bar": "/bar.html"` actually points to the file `"/example/bar.html"`.
The leading `/` is relative to the configuration directory.
Within `alias.json`, paths are relative to the project folder, so it’s written as `"/bar.html"`.

You can also skip aliases and use the full path directly, such as `"/example/bar.html"`.
Or, you can reassign a new alias in `config.json`, for example:

```json
{
    "alias": {
        "bar": "/example/bar.html"
    }
}
```

## Dev

The `dev` option is for development mode settings.
If you use Vite or another tool, you can specify the Dev Server URL here:

```json
{
    "dev": {
        "mikami": "http://localhost:5173/"
    },
    "startup": ["mikami.bar", "mikami.workspace", "mikami.desktop"]
}
```

In this configuration, `http://localhost:5173/` is the Vite development server address, which you can change in Vite’s settings.
This frontend server is mapped to a folder inside the configuration directory.
When mika-shell tries to access `/mikami/index.html`, it maps to `http://localhost:5173/index.html`.

When mika-shell detects the `dev` option, it also tries to read `http://localhost:5173/alias.json`.
For example, if `http://localhost:5173/alias.json` contains:

```json
{
    "bar": "/#/bar",
    "screenshot": "/#/screenshot",
    "app-launcher": "/#/app-launcher",
    "workspace": "/#/workspace",
    "clipboard": "/#/clipboard",
    "wf-recorder": "/#/wf-recorder",
    "power-menu": "/#/power-menu",
    "toolbar": "/#/toolbar",
    "quick-run": "/#/quick-run",
    "desktop": "/#/desktop"
}
```

You can then open the page `http://localhost:5173/#/bar` simply with `mikami.bar`.
