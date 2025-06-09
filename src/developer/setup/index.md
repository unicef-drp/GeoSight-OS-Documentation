---
title: Preparation
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
    - Irwan Fathurrahman
date: 2023-08-03
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2023, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
context_id: 0
---

## Setup Guides

We provide documentation for the most common operating systems in use at the time of writing. If you are using a different platform, you will need to adapt these instructions accordingly. Please note the storage requirements outlined below, as they will help you understand the space needed for a successful setup.

> ✏️ **Note:** After following the platform specific guide applicable to your system, please follow the generic instructions.

| | |
|-|-|
| **Windows 11 Pro**   | **macOS 15** |
| [![Windows](../img/windows-11.png)](./setup-win/index.md) | [![macOS](../img/mac-os.png)](./setup-mac/index.md) |
| **Ubuntu 24.04 LTS**   | **Generic Steps** |
| [![Ubuntu](../img/ubuntu--v1.png)](./setup-linux/index.md) | [![Steps](../img/settings.png)](./setup-generic/index.md) |

## Storage Requirements

Our development workflow is container centric, which means that you will need to have Docker installed on your system. This allows us to create a consistent development environment across different machines and operating systems. The following table outlines the appoximate storage requirements for the development environment (at the time of writing):

| Component | Storage Requirement |
|-----------|---------------------|
| Docker Images | 12 GB |
| Docker Volumes (media, static, db, backups) | 1 GB |
| Source Code | 2 GB |
| Documentation | 1 GB |
| Applications (vscode, wsl, docker desktop, etc.) | 7 GB |
| **Total** | **23 GB** |

Note the docker volumes could vary significantly in size depending on the amount of data you have in your media and static files, as well as the size of your database. The source code and documentation sizes are relatively stable. Also some operating systems will require less space than others, for example, Windows will require more space than Linux or macOS due to the way Docker is implemented on those platforms.
