# Docker Installation

1. Setup folder for repo keyrings

    ```bash
    sudo install -m 0755 -d /etc/apt/keyrings
    ```

2. Download Docker’s official GPG key

    ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    ```

3. Change permissions of Docker key

    ```bash
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    ```

4. Add the Docker repository to your `sources.list.d` file

    ```bash
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```

5. Install Community Edition Docker Engine

    ```bash
    sudo apt-get update && sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ```

6. Add your user to the `docker` group

    ```bash
    sudo usermod -aG docker $USER && newgrp docker
    ```

7. Install NVIDIA package for docker (optional)

    <aside>
    ⚠️ Only applicable if you have an NVIDIA driver installed

    </aside>

    ```bash
    sudo apt-get -y install nvidia-container-toolkit
    ```

8. Restart docker service

    ```bash
    sudo systemctl restart docker
    ```

9. If you encounter any problems using docker at this time, restart your system

    ```bash
    sudo reboot
    ```

# GitHub/GitLab Installation

1. Install Git package

    ```bash
    sudo apt-get update
    sudo apt-get -y install git xclip
    ```

2. Set account name

    ```bash
    git config --global user.name "your_name"
    ```

3. Set account email

    ```bash
    git config --global user.email "your_email@example.com"
    ```

4. Generate SSH key

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

5. Copy SSH key into clipboard

    ```bash
    xclip -sel ~/.ssh/id_rsa.pub
    ```

6. Now that you copied the generated SSH key to your clipboard, create a new SSH key on your GitHub account settings, and paste this one. Repeat this for your GitLab account (optional)