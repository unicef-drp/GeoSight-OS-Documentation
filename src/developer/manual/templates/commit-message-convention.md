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

## Commit Message Convention

To keep our GitHub commit history readable, traceable, and automation-friendly, follow the guidelines below for writing commit messages.

This policy applies to all commits in our **Python**, **JavaScript**, and **CSS** codebases.

---

## ✅ Format

```bash
<emoji> <type>: <short summary>

[Optional detailed description]

Refs: #issue-number
```

---

## 🎯 Type Tags

- ✨ `feat`: A new feature
- 🐛 `fix`: A bug fix
- 📝 `docs`: Documentation only changes
- 🎨 `style`: Changes that do not affect meaning (e.g., CSS tweaks)
- ♻️ `refactor`: Code changes that neither fix a bug nor add a feature
- ✅ `test`: Adding or updating tests
- 🔧 `chore`: Maintenance, build tasks, dependency updates
- 🚀 `ci`: Continuous Integration related changes

---

## 🧪 Example

```
✨ feat: add dynamic segmentation support for roads

Implements measure-based linear referencing using GeoJSON for route visualisation.
Refs: #42
```

---

## 🚫 Don’t

- Don’t use vague messages like `update`, `stuff`, or `fix bug`
- Don’t write past tense: prefer `Add` over `Added`
- Don’t forget to link to related issues where applicable

---

## 🧼 Do

- Use **present tense** ("Add" not "Added")
- Keep the **first line under 50 characters**
- Leave a **blank line** between summary and description
- Use **descriptive messages** that help others understand the change

---

By following these conventions, we make our codebase easier to navigate, automate changelogs, and maintain high team standards. 🚀
