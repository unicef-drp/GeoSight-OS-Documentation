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

# Removing your development environment

If you want to completely remove the development environment you should do the following:

* 🚩🚩🚩
* 🚩🚩🚩
* **WARNING:** The commands listed here are destructive and may result in loss of work if you do not have backups!
* 🚩🚩🚩
* 🚩🚩🚩

## Remove the code tree

To remove the code tree entirely:

```
rm -rf GeoSight-OS/
```

## Removing docker containers

To list all geosight docker containers:

```
docker ps -a | grep geosight
```

Example output:

```
3ab94374be3d   kartoza/geosight:0.4.0       "celery -A core work…"   24 hours ago   Restarting (2) 1 second ago                        geosight_worker
879ee98e353e   kartoza/geosight:0.4.0-dev   "/bin/sh -c 'echo Co…"   24 hours ago   Exited (137) 19 hours ago                          geosight_dev
2f0985ed8942   kartoza/geosight:0.4.0       "celery -A core beat…"   24 hours ago   Restarting (2) Less than a second ago              geosight_celery_beat
511960c2e3be   kartoza/postgis:13.0         "/bin/sh -c /scripts…"   24 hours ago   Up 14 seconds                           5432/tcp   geosight_db
05e118191596   bitnami/redis:7.0.2          "/opt/bitnami/script…"   24 hours ago   Exited (137) 19 hours ago                          geosight_redis
```

List only the ID's of geosight docker containers:

```
docker ps -a | grep geosight | awk '{print $1}'
```

Example output:

```
3ab94374be3d
879ee98e353e
2f0985ed8942
511960c2e3be
05e118191596
```

To kill all geosight docker containers:

```
docker kill $(docker ps -a | grep geosight | awk '{print $1}')
```

Example output:

```
3ab94374be3d
2f0985ed8942
511960c2e3be
Error response from daemon: Cannot kill container: 879ee98e353e: Container 879ee98e353e1e932028179b56c4bc4116ee60bc317b24f191e19d754c0989b0 is not running
Error response from daemon: Cannot kill container: 05e118191596: Container 05e1181915967393393074010ed250c1748b7b62df3541608d1c6cf130168a6f is not running
```

To remove all geosight docker containers:

```
docker rm $(docker ps -a | grep geosight | awk '{print $1}')
```

Example output:

```
3ab94374be3d
879ee98e353e
2f0985ed8942
511960c2e3be
05e118191596
```

Verification that everything is removed:

```
docker ps -a | grep geosight
```

Example output:

```
```
