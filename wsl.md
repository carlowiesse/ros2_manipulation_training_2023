# WSL Installation

1. Open PowerShell or Windows Command Prompt in administrator mode by right-clicking and selecting "Run as administrator"

2. Install Windows Subsystem for Linux (WSL)

    ```bash
    wsl --install
    ```

3. List Linux distros available for download through the online store

    ```bash
    wsl --list --online
    ```

4. Install additional Linux distributions after the initial install (optional)

    ```bash
    wsl --install -d <Distribution Name>
    ```

    Where `<Distribution Name>` can be taken from the available Linux distros listed on the previos step

5. Check the WSL version

    ```bash
    wsl --list --version
    ```

    If WSL is using version 1, you have to upgrade to version 2

    ```bash
    wsl --set-version <Distribution Name> 2
    ```

    Where `<Distribution Name>` can be taken from the available Linux distros listed on the previos step

# Xserver Installation

1. Install Xlaunch from this link: https://sourceforge.net/projects/vcxsrv/

2. Open a WSL terminal

3. Add the `DISPLAY` variable to your `.bashrc`

    ```bash
    echo "export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0" >> ~/.bashrc
    source ~/.bashrc
    echo $DISPLAY
    ```

4. Install Xserver dependecies for WSL Linux distro

    ```bash
    sudo apt-get update
    sudo apt-get install x11-apps x11-xserver-utils git python3-vcstool
    ```
