# WSL Installation

1. Open PowerShell or Windows Command Prompt in administrator mode by right-clicking and selecting "Run as administrator"

2. Install Windows Subsystem for Linux (WSL)

    ```bash
    wsl --install
    ```

3. Install Ubuntu 22.04

    ```bash
    wsl --install -d Ubuntu-22.04
    ```

4. Set WSL version to 2

    ```bash
    wsl --set-version Ubuntu-22.04 2
    ```

5. Set Ubuntu 22.04 as default WSL Linux distro

    ```bash
    wsl --set-default Ubuntu-22.04
    ```

6. Restart your computer

# Xserver Installation

1. Install Xlaunch from this link: https://sourceforge.net/projects/vcxsrv/

2. Open a WSL terminal

3. Add the `DISPLAY` variable to your `.bashrc` file

    ```bash
    echo "export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0" >> ~/.bashrc && source ~/.bashrc
    ```

4. Install Xserver dependecies for WSL Linux distro

    ```bash
    sudo apt-get update && sudo apt-get install x11-apps x11-xserver-utils
    ```

# Docker WSL Setup

1. Open Docker Desktop
2. Go to Settings
3. Click on Resources and select WSL Integration
4. Enable Ubuntu 22.04

# Other Dependencies

1. Open a WSL terminal
  
2. Install some dependecies for WSL Linux distro

    ```bash
    sudo apt-get update && sudo apt-get install git python3-vcstool
    ```
