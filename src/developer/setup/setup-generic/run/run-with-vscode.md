---
title: VSCode Launch Script
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

## VSCode Launch Script

When you use the ``./vscode.sh`` launch script, it will help you install all of necessary VSCode extensions, as well as open the project in VSCode.

If the code CLI is already installed, you can run

```bash
./vscode.sh
```

This will install any needed extensions and launch vscode. Wait until the process is done...

> ⭐️ **Note:** The first time you run the script, you will need to close the VSCode window that opens, and then run the script again. This is because the script will install the necessary extensions, and then you need to reopen VSCode to apply them.

## Building the dev environment

Simply click on this option, and it will automatically build the development containers for you.

![image.png](../img/building-16.png)

🚧 If no "Reopen in container" shows, you can build manually by checking [No Reopen in container shows](#no-reopen-in-container-shows) guide.

Once the task is running, a notification 1️⃣ will be shown in the bottom right of the VSCode window. Clicking in the notification will show you the setup progress 2️⃣. Note that this make take quite a while depending on the internet bandwidth you have and the CPU power of your machine.

![image.png](../img/building-2.png)

At the end of this process, you will see a message like this:

```
[229365 ms] Port forwarding 53251 > 46727 > 46727 terminated with code 0 and signal null.
```

Once you see that, you can continue the next step below.<br>
Note that the Port forwarding can changes everytime you deploy, so as long as it says `terminated with code 0 and signal null`, you are done and can continue to next step.

## Run application

After completing the steps above, You need to run the app.<br>
Click `Run and Debug` button 1️⃣ and then select `Django: Run server` 2️⃣. After it is selected, click `Start Debugging` 3️⃣.

![image.png](../img/building-6.jpg)

After run, it will a new tab in the right bottom.
You need to wait Python debug to finish by saying `Quit the server with CONTROL-C.`3️⃣,

![image.png](../img/building-7.png)

## Viewing your test instance

After completing the steps above, you should have the development server available.

Just ctrl + click the url link `0.0.0.0:8080` and click `Open`

![image.png](../img/building-23.png)
![image.png](../img/building-24.png)

Or you can access your server directly on port 2000 of your local host:

```
http://localhost:2000
```

![image.png](../img/building-5.png)

The site will be rather bare bones since it will need to be configured in the admin area to set up the theme etc.

By Default, we can use the admin credential:

```
username : admin
password : admin
```

> 🪧 Now that the application is set up, you may begin making updates or choose to work with the provided demo data. For instructions, please refer to the [Demo Data Guide](../demo-data.md).

## Troubleshooting

### No code CLI found

If code cli check is failed, you can check below how to set cli

#### Linux

It will be already setup if using snap to install code

#### Windows

1. Open Windows VS Code
2. Install the "Remote - WSL" extension
3. Open a WSL terminal and try check again

#### MacOS

1. Open VS Code
2. Press Cmd+Shift+P
3. Type: Shell Command: Install 'code' command in PATH
4. Press Enter
5. This will create a symlink:

```
/usr/local/bin/code -> /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code
```

And try to check it again via

```bash
code --version
```

If you success setup code cli, you can move to [configuration](../configuration.md).

If you are still having trouble with it, you can do next step, which is set up manually.

### Installing devcontainers extension

You can install [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension manually (minimum version 0.304.0).

![image.png](../img/ide-dev-containers-1.png)  

![image.png](../img/ide-dev-containers-2.png)

### Open project

Open the project in VSCode (1️⃣, 2️⃣) by navigating the place on your file system where you checked out the code in the pre-requisites step above (3️⃣).

![image.png](./../img/ide-setup-1.png)

Accept the 'trust authors' prompt

![image.png](./../img/ide-setup-2.png)

After that everything above is done, you can move on to [Building the dev environment](#building-the-dev-environment).

### No reopen in container shows

Press `Ctrl -> P` 1️⃣ and then `>`and search for `Rebuild`. Select `Dev Containers: Rebuild and Reopen in Container`2️⃣. This will essentially mount your code tree inside a docker container and switch the development context of VSCode to be inside the container where all of the python etc. dependencies will be installed.

![image.png](../img/building-1.png)
> 🪧 Now that the application is set up, you may begin making updates or choose to work with the provided demo data. For instructions, please refer to the [Demo Data Guide](../demo-data.md).
