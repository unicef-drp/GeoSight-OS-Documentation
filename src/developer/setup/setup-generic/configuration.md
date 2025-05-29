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

# Configuration

In this step, you'll update some files to get the project working — but don’t worry, most of it is automated.
All you need to do is:

1. Navigate to the root of the project.
2. Run the setup script:

```bash
./setup.sh
```

> 🪧 Now that the codebase is set up, you’re ready to run the application. Continue to the [Run Guide](run/index.md).
You may also want to review how to set up other environments before running the project.


## Set up different environment (optional)
To set up different environment, for example the Default credential, or the port of server, open **deployment/.env**.
You can check the description below for each of variable.

```
COMPOSE_PROJECT_NAME=geosight
NGINX_TAG=0.0.1  
DJANGO_TAG=3.0.0 

# Environments
DJANGO_SETTINGS_MODULE=core.settings.prod 
ADMIN_USERNAME=admin -> Default admin username 
ADMIN_PASSWORD=admin -> Default admin password
ADMIN_EMAIL=admin@example.com -> Default admin email
INITIAL_FIXTURES=True
HTTP_PORT=80 -> Change the port of nginx

# Database Environment
DATABASE_NAME=django -> Default database name
DATABASE_USERNAME=docker -> Default database username
DATABASE_PASSWORD=docker -> Default database password
DATABASE_HOST=db -> Default database host. Change this if you use cloud database or any new docker container.
RABBITMQ_HOST=rabbitmq

# --------------------------------
# ---------- APP DOMAIN ----------
# Required for tenant configurations
APP_DOMAIN=localhost -> The main domain for the application for tenants

# -------------------------------
# ---------- PLUGINS ------------
# Specify the plugins to enable or disable
# Use a comma-separated list

# GeoSight plugins:
# - tenants
# - cloud_native_gis
# - reference_dataset
# - machine_info_fetcher
PLUGINS=cloud_native_gis,reference_dataset -> Use comma separator for activate plugins
# -----------------------------
```
