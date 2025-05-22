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

# Run without IDE

If you're using a text editor other than an IDE (such as VS Code, Sublime Text, or Vim), you can run the application manually from the terminal:

1. Navigate to the root directory of the project.
2. Open a terminal and execute the following command:

```
make dev
```

Note: With this approach, you won’t have access to integrated debugging features provided by full IDEs.

## Viewing your test instance

After completing the steps above, you should have the development server available on port 2000 of your local host:

```
http://localhost:2000
```

![image.png](img/building-5.png)

By Default, we can use the admin credential:
```
username : admin
password : admin
```

🪧 Now that the application is set up, you may begin making updates or choose to work with the provided demo data. For instructions, please refer to the [Demo Data Guide](demo-data.md).