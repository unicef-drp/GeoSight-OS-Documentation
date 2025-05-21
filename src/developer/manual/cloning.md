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

# Checking out the Code

This section outlines the process of checking out the code for local development.

🚩 Make sure you have gone through the [Prerequisites Section](prerequisites.md) before following these notes.


Ananymous Git code check out  https://github.com/unicef-drp/GeoSight-OS.git

```
git clone https://github.com/unicef-drp/GeoSight-OS.git
```

Alternatively check out over ssh:

```
git clone git@github.com:unicef-drp/GeoSight-OS.git
```

Once the code is checked out, you can open it in VSCode by doing the following:

```
cd GeoSight-OS
code .
```


📒**Which branch to use?**: Note that we deploy our staging work from the `develop` branch and our production environment from the `main` branch. If you are planning on contributing improvements to the project, please submit them against the `develop` branch.


🪧 Now that you have the code checked out, move on to the [IDE Setup](ide-setup.md) documentation.