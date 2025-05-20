---
title: GeoSight-OS Documentation Home 
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
    - Irwan Fathurrahman
    - Danang Tri Massandy
date: 2025-06-20
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2023, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---

## Setup Docker with WSL2 on Windows

### WSL2
WSL2 is needed to run linux environment in Windows. Follow step by step below to install WSL2.

1. Open Powershell as Administrator

![image.png](img/wsl-1.png)

2. Install wsl with below command

```
wsl --install
```

![image.png](img/wsl-2.png)

3. Once completed, you need to restart the machine.
4. You can check if the installation is completed successfully by checking the list of installed distribution from the Powershell.

```
wsl --list
```

By default, the Ubuntu is chosen and installed after running the first command. However if there is no distribution that is installed like image below, we can then install it manually.

![image.png](img/wsl-3.png)

5. To list all the available distribution, we can run command:

```
wsl --list --online
```

The results:

```
The following is a list of valid distributions that can be installed.
Install using 'wsl.exe --install <Distro>'.

NAME                            FRIENDLY NAME
AlmaLinux-8                     AlmaLinux OS 8
AlmaLinux-9                     AlmaLinux OS 9
AlmaLinux-Kitten-10             AlmaLinux OS Kitten 10
Debian                          Debian GNU/Linux
FedoraLinux-42                  Fedora Linux 42
SUSE-Linux-Enterprise-15-SP5    SUSE Linux Enterprise 15 SP5
SUSE-Linux-Enterprise-15-SP6    SUSE Linux Enterprise 15 SP6
Ubuntu                          Ubuntu
Ubuntu-24.04                    Ubuntu 24.04 LTS
archlinux                       Arch Linux
kali-linux                      Kali Linux Rolling
openSUSE-Tumbleweed             openSUSE Tumbleweed
openSUSE-Leap-15.6              openSUSE Leap 15.6
Ubuntu-18.04                    Ubuntu 18.04 LTS
Ubuntu-20.04                    Ubuntu 20.04 LTS
Ubuntu-22.04                    Ubuntu 22.04 LTS
OracleLinux_7_9                 Oracle Linux 7.9
OracleLinux_8_7                 Oracle Linux 8.7
OracleLinux_9_1                 Oracle Linux 9.1
```

6. We will use the latest Ubuntu version, 24.04 LTS. To install it, run command:

```
wsl --install Ubuntu-24.04
```

![image.png](img/wsl-4.png)

7. Once ubuntu is installed, we can setup the user account for Ubuntu. Search for ubuntu from the search bar and click Open to run it.

![image.png](img/wsl-5.png)

It will open a terminal where you can setup username and password for your Ubuntu.

![image.png](img/wsl-6.png)

After your user account is created, you will see below image that indicates the installation is successful.

![image.png](img/wsl-7.png)

8. You should update your system after this by running command:

```
sudo apt-get update && sudo apt-get upgrade
```

9. **Install Git**

```
sudo apt-get install git
```

10. **(Optional) Generate SSH key pair**

The SSH are preferred when fetching and pushing codes to GitHub. Please follow [this link](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux#generating-a-new-ssh-key) to generate SSH key pair and add it into your GitHub account.

11. **(Optional) Install GPG on WSL2**

GPG signing keys are used to sign the commits. WSL can use the keys from Windows by following [this tutorial](https://gist.github.com/matthiasr/473072eeffe449459e3ccd0f5192afc7). Once the key is generated, please follow [this link](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account) to add it into your GitHub account.


### Install Docker Desktop

Follow [this guide](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers#overview-of-docker-containers) to install docker desktop that integrates with WSL2. After docker is installed and running, we recommend to disable the `Resource Saver` feature as it may cause unexpected issue during development.

![image.png](img/wsl-8.png)
