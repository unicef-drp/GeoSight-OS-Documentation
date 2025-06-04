---
title: macOS Setup Guide 
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
    - Irwan Fathurrahman
date: 2025-06-20
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2023, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---

## macOS Setup Guide

### VSCode

For macOS it is recommended to fetch and install VSCode from [the VSCode home page](https://code.visualstudio.com/).

You also need to have the code CLI available. To do this, open VSCode, go to the Command Palette (Cmd+Shift+P), and type `Shell Command: Install 'code' command in PATH`. This will allow you to run `code` from the terminal.

To check:

```bash
code --version
```

It should return something like the output below:

```bash
1.100.2
848b80aeb52026648a8ff9f7c45a9b0a80641e2e
arm64
```

### Setup Docker on macOS

We recommend using the official Docker Desktop application. See [docker website](https://www.docker.com) for setup tools.

> ⭐️ **Note:** If you are using an arm based Mac (M1, M2, M3 etc.), you will need to ensure that you download the version of Docker Desktop that is compatible with Apple Silicon.

At the end of the installation, you should have a working Docker Desktop application. You can verify this by running:

```bash
docker --version
```

### Homebrew

Make sure you have [Homebrew](https://brew.sh) installed. If not, you can install it by running:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the on-screen instructions. After installation, you may need to add Homebrew to your shell profile (.zprofile, .zshrc, etc.).

### ✅ jq

jq is a command-line JSON processor.

```bash
brew install jq
```

Verify:

```bash
jq --version
```

### ✅ make

Option 1: Install via Xcode Command Line Tools

```bash
xcode-select --install
```

### Git

brew install git

### Recommended

If you want to share changes upstream to GeoSight-OS, you should sign your commits. See the [GitHub Documentation](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits) on this topic to see how to prepare your system for this.

## Next Steps

> 🪧 Now that you have the docker, move on to the generic workflow, starting with [Cloning](../setup-generic/cloning.md).
