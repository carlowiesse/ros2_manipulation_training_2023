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

- Add the NVIDIA Docker repository to your `sources.list.d` file

    ```bash
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    ```

- Install NVIDIA Docker package

    ```bash
    sudo apt-get update && sudo apt-get -y install nvidia-container-toolkit
    ```

8. Restart docker service

    ```bash
    sudo systemctl restart docker
    ```

9. If you encounter any problems using docker at this time, restart your system

    ```bash
    sudo reboot
    ```
