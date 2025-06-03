---
title: Skills Needed
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

## Skills Needed

GeoSight is a complex web-based business intelligence platform that requires a diverse set of skills for effective development and maintenance. Here are some of the key skills needed:

- Proficiency in web development technologies (HTML, CSS, JavaScript)
- Experience with front-end frameworks (e.g., React, Angular, Vue.js) - we use ReactJS in this project.
- Knowledge of back-end technologies (e.g., Node.js, Python, Ruby) - we use Python and NodeJS in this project.
- Familiarity with database management systems (e.g., PostgreSQL, MongoDB) - we use PostgreSQL in this project.
- Understanding of RESTful APIs and microservices architecture - we use the Django Rest Framework for our APIs.
- Experience with cloud platforms (e.g., AWS, Azure, Google Cloud) - this is only needed if you want to deploy GeoSight on the cloud.
- Knowledge of geospatial technologies (e.g., GIS, mapping libraries) - in particular we use MapLibre, Vector Tiles, OGC services, GeoJSON and PostGIS.
- Familiarity with data visualization tools and libraries (e.g., D3.js, Tableau) - these will inspire you to create better visualizations in GeoSight.
- Strong problem-solving skills and attention to detail - we want to maintain a high quality codebase.
- Ability to work collaboratively in a team environment - we are a small team and we want to work together to make GeoSight better.
- Good understanding of version control systems (e.g., Git) - we use GitHub for version control.
- Use of GPG for signing commits and tags - this is a requirement for all contributors to GeoSight.
- Use of SSH for secure access to the repository - this is a requirement for all contributors to GeoSight.
- Basic knowledge of Linux command line - this is useful for development and deployment.
- Docker skills - we use Docker for containerization and deployment.

```mermaid
flowchart TD
    %% Key skills with emphasis
    K1["Docker"]:::key
    K2["PostgreSQL"]:::key
    K3["Django Rest Framework"]:::key
    K4["MapLibre"]:::key

    %% Other skills
    S1["Web development (HTML, CSS, JS)"]:::cloud
    S2["ReactJS"]:::cloud
    S3["NodeJS"]:::cloud
    S4["Cloud platforms"]:::cloud
    S5["Vector Tiles"]:::cloud
    S6["OGC services"]:::cloud
    S7["GeoJSON"]:::cloud
    S8["PostGIS"]:::cloud
    S9["Data visualization"]:::cloud
    S10["Problem-solving"]:::cloud
    S11["Teamwork"]:::cloud
    S12["GitHub"]:::cloud

    %% Arrange in 5 rows (no links)
    subgraph Row1[ ]
        direction LR
        K1
        S1
        S2
        K2
        S3
    end
    subgraph Row2[ ]
        direction LR
        S4
        K3
        S5
        S6
        S7
    end
    subgraph Row3[ ]
        direction LR
        S8
        S9
        K4
        S10
        S11
    end
    subgraph Row4[ ]
        direction LR
        S12
        S13
    end

    classDef key fill:#ffe082,stroke:#f57c00,stroke-width:3px;
    classDef cloud fill:#e0f7fa,stroke:#00796b,stroke-width:2px;
```
