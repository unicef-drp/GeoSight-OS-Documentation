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

## Set up the project

This will set up the GeoSight project on your machine
```
cd GeoSight
cd deployment
cp docker-compose.override.template.yml docker-compose.override.yml
cp .template.env .env
cd ..
make up
```
Wait until everything is done.

After everything is done, open up a web browser and go to [http://127.0.0.1/](http://127.0.0.1/) and the dashboard will open:

By Default, we can use the admin credential:
```
username : admin
password : admin
```

## Set up different environment (optional)
To set up different environment, for example the Default credential, or the port of server, open **deployment/.env**.
You can check the description below for each of variable.

```
COMPOSE_PROJECT_NAME=geosight
NGINX_TAG=0.0.1  -> Change this for different nginx image
DJANGO_TAG=0.0.1 -> Change this for different django image
DJANGO_DEV_TAG=0.0.1 -> Change this for different django dev image

# Environments
DJANGO_SETTINGS_MODULE=core.settings.prod -> Change this to use different django config file
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

# Onedrive
PUID=1000
PGID=1000

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


🪧 Now that the codebase is set up, you are ready to run the application, move on to the [run guide](run.md).

