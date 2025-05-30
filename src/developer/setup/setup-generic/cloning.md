---
title: Cloning the Code
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

## Cloning the Code

You need to check out over ssh - this implies that you have configured your GitHub account with an SSH key:

```bash
git clone git@github.com:unicef-drp/GeoSight-OS.git
```

> 📒**Which branch to use?**: Note that we deploy our **staging** site from the `main` branch and our production environment from the latest **release** tag. If you are planning on contributing improvements to the project, please submit them against the `main` branch.

> 🪧 Now that you have cloned the project, move on to the [configuration](configuration.md).
