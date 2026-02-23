---
title: API Guide
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Irwan Fathurrahman
date: 2025-10-16
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2025, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
---

# API Guide
This section provides detailed information and examples for using the GeoSight RESTful API. The guide helps developers and data analysts understand how to interact programmatically with the platform and automate common tasks efficiently.

## Authentication

All API requests must include an API token in the `Authorization` header. You can generate or retrieve your token from the GeoSight user profile page.

```
Authorization: Token <your-api-token>
GeoSight-User-Key: <your-email-address>
```

**Example using curl:**

```bash
curl -X GET "https://<your-geosight-host>/api/v1/context-layers/" \
  -H "Authorization: Token <your-api-token>" \
  -H "GeoSight-User-Key: <your-email-address>"
```

Requests made without a valid token will receive an `HTTP 401 Unauthorized` response.

------------------------------------

* [Cloud Native GIS context layer](../guide/context-layer/cloud-native-gis.md), describes common workflows for handling cloud-native GIS context layers.