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

# Xserver Installation

1. Install Xlaunch from this link: https://sourceforge.net/projects/vcxsrv/

2. Open a WSL terminal

3. Add the `DISPLAY` variable to your `.bashrc`

    ```bash
    echo "export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0" >> ~/.bashrc
    source ~/.bashrc
    ```

4. Install Xserver dependecies for WSL Linux distro

    ```bash
    sudo apt-get update
    sudo apt-get install x11-apps
    ```

# GitHub/GitLab Installation

1. Open a WSL terminal

2. Install Git package

    ```bash
    sudo apt-get update
    sudo apt-get -y install git xclip
    ```

3. Set account name

    ```bash
    git config --global user.name "your_name"
    ```

4. Set account email

    ```bash
    git config --global user.email "your_email@example.com"
    ```

5. Generate SSH key

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

6. Copy SSH key into clipboard

    ```bash
    xclip -sel ~/.ssh/id_rsa.pub
    ```

7. Now that you copied the generated SSH key to your clipboard, create a new SSH key on your GitHub account settings, and paste this one. Repeat this for your GitLab account (optional)