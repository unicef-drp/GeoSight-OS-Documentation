---
title: GeoSight-OS Documentation Home
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
  - Tim Sutton
  - Irwan Fathurrahman
date: 2025-05-13
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2025, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---

# Translations

GeoSight allows for multi-lingual interface using built-in Djanog and React components. 


## Adding a New Language


To add a new language, do the following

1. Find the two letter language code from [this website](http://www.i18nguy.com/unicode/language-identifiers.html) (eg. for Brazilian Portuguese, this would be `pt-BR`)
2. In `django_project/core/settings/project.py`, add the language with its name in English and the code **in all lowercase** as follows:
    
    ```python
    # Set languages which want to be translated
    LANGUAGES = (
        ('en-us', _('English')),
        ('es-es', _('Spanish')),
        ...
        ('pt-br', _('Portuguese')), # <- Example addition
    )
    ```
    
3. In `django_project/frontend/locales/react`, create a new folder with its name as the new language code as follows:
    
    ```bash
    django_project/
    └── frontend/
    		└── locales/
    				└── react/
    				    └── en-US/
    				    └── es-ES/
    					    ...
    				    └── pt-BR/ <- (example addition)
    ```
    
4. Within the new language folder, add a `common.json` as follows:
    
    ```bash
    django_project/
    └── frontend/
    		└── locales/
    				└── react/
    				    └── en-US/
    				    └── es-ES/
    					    ...
    				    └── pt-BR/
    						    └── common.json <- (example addition)
    ```
    
5. In the new `common.json`, copy the dictionary of keys from the `common.json` in another already established language:
    
    ```json
    {
        "native": {
            "name": "English",
            "flag": "🇺🇸"
        },
        "pages": {
    		    "projects": "Projects",
    		    "indicators": "Indicators"
        },
        "create": "Create New {{pageName}}",
        ...
    }
    ```
    
6. Change the `native.name` and `native.flag` to the native name of the language and the flag of the country which it is from (this is what will be displayed on the frontend language selector)
    
    ```json
    {
        "native": {
            "name": "Português",
            "flag": "🇧🇷"
        },
        "pages": {
    		    "projects": "Projects",
    		    "indicators": "Indicators"
        },
        "create": "Create New {{pageName}}",
        ...
    }
    ```
    
7. Change all of the values in the dictionary into the new language so that your new `common.json` looks like this:
    
    ```json
    {
        "native": {
            "name": "Português",
            "flag": "🇧🇷"
        },
        "pages": {
            "projects": "Projetos",
            "indicators": "Indicadores"
        },
        "create": "Criar novo(a) {{pageName}}"
        ...
    }
    ```
    
8. In `django_project/frontend/locales/django`, create a new folder with its name as the new language code **but with an underscore instead of a hyphen** (- → _) as follows:
    
    ```bash
    django_project/
    └── frontend/
    		└── locales/
    				└── django/
    				    └── en_US/
    				    └── es_ES/
    					    ...
    				    └── pt_BR/ <- (example addition)
    ```
    
9. Within the new language folder, add another folder names `LC_MESSAGES` as follows:
    
    ```bash
    django_project/
    └── frontend/
    		└── locales/
    				└── react/
    				    └── en-US/
    				    └── es-ES/
    					    ...
    				    └── pt-BR/
    						    └── LC_MESSAGES/ <- (example addition)
    ```
    
10. Within the `LC_MESSAGES` folder, create a file named `django.po` as follows:
    
    ```bash
    django_project/
    └── frontend/
    		└── locales/
    				└── react/
    				    └── en-US/
    				    └── es-ES/
    					    ...
    				    └── pt-BR/
    						    └── LC_MESSAGES/
    								    └── django.po <- (example addition)
    ```
    
11. In the new `django.po`, copy the contents from the `django.po` in another already established language:
    
    ```bash
    # English translations for GeoSight package.
    # Copyright (C) 2024 UNICEF
    # This file is distributed under the same license as the GeoSight package.
    msgid ""
    msgstr ""
    "Project-Id-Version: GeoSight\n"
    "Report-Msgid-Bugs-To: \n"
    "POT-Creation-Date: 2024-03-21 12:00+0000\n"
    "PO-Revision-Date: 2024-03-21 12:00+0000\n"
    "Last-Translator: \n"
    "Language-Team: English\n"
    "Language: en_US\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=2; plural=(n != 1);\n"
    
    #: frontend/views/admin/dashboard/list.py:38
    msgid "Projects"
    msgstr "Projects"
    
    ...
    ```
    
12. Change lines 11 and 12 to the language name (in English) and the folder name, respectively, as follows:
    
    ```bash
    # English translations for GeoSight package.
    # Copyright (C) 2024 UNICEF
    # This file is distributed under the same license as the GeoSight package.
    msgid ""
    msgstr ""
    "Project-Id-Version: GeoSight\n"
    "Report-Msgid-Bugs-To: \n"
    "POT-Creation-Date: 2024-03-21 12:00+0000\n"
    "PO-Revision-Date: 2024-03-21 12:00+0000\n"
    "Last-Translator: \n"
    "Language-Team: Portuguese\n" # <- CHANGED
    "Language: pt_BR\n" # <- CHANGED
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=2; plural=(n != 1);\n"
    
    #: frontend/views/admin/dashboard/list.py:38
    msgid "Projects"
    msgstr "Projects"
    
    ...
    ```
    
13. On every line that begins with `msgstr`, change the value to the translation in the new language:
    
    ```bash
    # English translations for GeoSight package.
    # Copyright (C) 2024 UNICEF
    # This file is distributed under the same license as the GeoSight package.
    msgid ""
    msgstr ""
    "Project-Id-Version: GeoSight\n"
    "Report-Msgid-Bugs-To: \n"
    "POT-Creation-Date: 2024-03-21 12:00+0000\n"
    "PO-Revision-Date: 2024-03-21 12:00+0000\n"
    "Last-Translator: \n"
    "Language-Team: Portuguese\n"
    "Language: pt_BR\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=2; plural=(n != 1);\n"
    
    #: frontend/views/admin/dashboard/list.py:38
    msgid "Projects"
    msgstr "Projectos" # <- CHANGED
    
    ...
    ```
    
14. In the terminal, run this command inside `django_project`:
    
    ```bash
    python manage.py compilemessages
    ```
    
    You should now see a new `django.mo` file next to the `django.po` as follows:
    
    ```bash
    django_project/
    └── frontend/
    		└── locales/
    				└── react/
    				    └── en-US/
    				    └── es-ES/
    					    ...
    				    └── pt-BR/
    						    └── LC_MESSAGES/
    								    └── django.po
    								    └── django.mo <- (just appeared)
    ```
    

Now, you should be able to see the new language available, and when you switch to it, all marked strings should be translated.


## Adding a New Translation

### React

In any file that requires translation, do the following:

1. Add `import { useTranslation } from 'react-i18next';` to the top of the file
2. Within the component itself, insert `const { t } = useTranslation();` (near the top of the component for style)
3. For any string requiring translation, do the following:
    1. If the string looks like this
        
        ```jsx
        const label = "Context Layers"
        ```
        
        1. For each `django_project/frontend/locales/react/[LANGUGE-CODE]/common.json` (where `[LANGUAGE-CODE]` is `en-US`, `es-ES`, etc.), add a key-value pair for you new translation, where the key is a [camelCase](https://en.wikipedia.org/wiki/Camel_case) descriptor of the string and the value is the string in the proper language
            
            ```json
            {
            	...
            	"contextLayers": "Context Layers"
            }
            ```
            
        2. Replace the string in the component with the dynamic dictionary entry
            
            ```jsx
            const label = {t('contextLayers')}
            ```
            
    2. If the component looks like this
        
        ```jsx
        const label = "Create New " + page
        ```
        
        1. For each `django_project/frontend/locales/react/[LANGUGE-CODE]/common.json` (where `[LANGUAGE-CODE]` is `en-US`, `es-ES`, etc.), add a key-value pair for you new translation, where the key is a [camelCase](https://en.wikipedia.org/wiki/Camel_case) descriptor of the string and the value is the string in the proper language with any variables in double curly brackets
            
            ```json
            {
            	...
            	"createNewPageName": "Create New {{pageName}}"
            }
            ```
            
        2. Replace the string in the component with the dynamic dictionary entry
            
            ```jsx
            const label = {t('createNewPageName', {pageName: page})}
            ```
            

<aside>
<img src="https://www.notion.so/icons/flag-swallowtail_gray.svg" alt="https://www.notion.so/icons/flag-swallowtail_gray.svg" width="40px" />

If you have translations inside of sub-dictionaries like this…

```json
{
	"pages": {
		"indicators": "Indicators"
	}
}
```

The key to reference is like this

```jsx
t('pages.indicators')
```

</aside>

### Django

In any file that requires translation, do the following:

1. Add `from django.utils.translation import gettext as _` to the top of the file
2. For any string requiring translation, change the string to a key entry for the dictionary using the `_` function from this…
    
    ```python
    return 'Indicators'
    ```
    
    …to this
    
    ```python
    return _('Indicators')
    ```
    
3. In the terminal, run this command inside `django_project`:
    
    ```bash
    python manage.py makemessages -a
    ```
    
4. For each `django_project/frontend/locales/django/[LANGUGE-CODE]/LC_MESSAGES/django.po` (where `[LANGUAGE-CODE]` is `en_US`, `es_ES`, etc.), add find the `msgid` corresponding to the new translation key and input the proper translation in the `msgstr` field below it
    
    ```bash
    # Spanish translations for GeoSight package.
    # Copyright (C) 2024 UNICEF
    # This file is distributed under the same license as the GeoSight package.
    msgid ""
    msgstr ""
    "Project-Id-Version: GeoSight\n"
    "Report-Msgid-Bugs-To: \n"
    "POT-Creation-Date: 2024-03-21 12:00+0000\n"
    "PO-Revision-Date: 2024-03-21 12:00+0000\n"
    "Last-Translator: \n"
    "Language-Team: Spanish\n"
    "Language: es_ES\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=2; plural=(n != 1);\n"
    
    #: frontend/views/admin/dashboard/list.py:38
    msgid "Projects"
    msgstr "Proyectos"
    
    ...
    
    # 
    #: frontend/views/admin/indicator/list.py:32 <- JUST APPEARED
    msgid "Indicators"
    msgstr "Indicadores" # <- CHANGED
    ```
    
5. In the terminal, run this commands inside `django_project`:
    
    ```bash
    python manage.py compilemessages
    ```