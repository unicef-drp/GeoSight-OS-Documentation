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


# Setup the georepo config

GeoSight is able to use GeoRepo instance for the administrative boundary.
But before it can be used, you need to put our georepo config in django admin properly.

First, you need to login to site.

![image.png](img/building-9.png)

Login as admin

![image.png](img/building-10.png)

After logged in, click "white circle" on the top-right 1️⃣  and click `django admin`  2️⃣.

![image.png](img/building-11.png)

Find `Site preferences` 1️⃣  and click it and find GeoRepo section 2️⃣. Uncheck `Georepo using user api key` if you want to not force user to put their own georepo api key, instead using GeoSight api key 3️⃣.

![image.png](img/building-12.png)

First you need to decide which georepo instance you are going to use.
Put in Georepo url input with <url georepo>/api/v1

Example, we are going to use https://staging-georepo.unitst.org/
So the GeoRepo url is https://staging-georepo.unitst.org/api/v1

![image.png](img/building-13.png)

There are 2 types of georepo api key, which is level 1 and level 4.
You can ask georepo admin to provide those 2 key or you can put your own api key for both of those.

To do that, you can go to <your Georepo url>/profile.
In this case, it is https://staging-georepo.unitst.org/profile
And you can check documentation how to generate it.
https://unicef-drp.github.io/GeoRepo-OS/user/api/guide/#generating-an-api-key

One user can just have 1 api key, so for that you can put the same api key to level 1 and level 4.
So, you can fill Georepo api key level 1 and level 4 with your api key 1️⃣  and Georepo api key level 1 email and level 4 email with your email in georepo 2️⃣.

![image.png](img/building-14.png)

Then click `save` button 1️⃣ in the most bottom of the page and the site is ready.

![image.png](img/building-15.png)