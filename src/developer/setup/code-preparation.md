---
title: GeoSight-OS Documentation Home
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
  - Tim Sutton
  - Irwan Fathurrahman
date: 2023-08-03
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2023, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---

# Code preparation

This steps, you need to update some files to make the project works.

## Copying files

Go to deployment and

```
Copy the `template.env` to `.env`
Copy the `docker-compose.override.template.yml` to `docker-compose.override.yml`
```

![image.png](./img/file-copying.png)

## Note for Apple Silicon

**Note for Apple Silicon**
Before proceeding with the setup, if you are developing on an Apple Silicon or
other AMD-based devices, please ensure to uncomment line 17 in
the [deployment/docker/Dockerfile](https://github.com/unicef-drp/GeoSight-OS/blob/main/deployment/docker/Dockerfile#L17).

```
#ARG PLATFORM=linux/arm64
```

🪧 Now that the codebase is set up, you are ready to run the application.

1. If you are using **VS Code**, please refer to the [Run with VSCode](run-with-vscode.md) guide.
2. If you are using **PyCharm**, please refer to the [Run with PyCharm](run-with-pycharm.md) guide.
3. If you are not using an IDE and prefer to work directly with a text editor, please refer to the [Run without IDE](run-without-ide.md) guide.

   Note: With this approach, you won’t have access to integrated debugging features provided by full IDEs.