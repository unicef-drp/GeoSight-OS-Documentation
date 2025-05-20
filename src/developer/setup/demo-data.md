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

# Demo data

## Run demo data

GeoSight has demo data that can be restored.

To restore demo data:
```
cd django_project/
python manage.py loaddata core/fixtures/demo/1.core.json
python manage.py loaddata core/fixtures/demo/2.user_group.json
python manage.py loaddata core/fixtures/demo/3.geosight_georepo.json
python manage.py loaddata geosight/reference_dataset/fixtures/test/4.reference_dataset_levels.json
python manage.py loaddata core/fixtures/demo/4.geosight_data.json
python manage.py loaddata core/fixtures/demo/5.geosight_permission.json
```