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

# Cloning out the Code

You need to check out over ssh:

```
git clone git@github.com:unicef-drp/GeoSight-OS.git
```

📒**Which branch to use?**: Note that we deploy our staging work from the `main` branch and our production environment from the release tag. If you are planning on contributing improvements to the project, please submit them against the `main` branch.

🪧 Now that you have the docker and cloned the project, move on to the [code preparation](code-preparation.md).