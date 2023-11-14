# Quickstart

1. Setup workspace

    ```bash
    ./setup.sh
    ```

2. Build Docker image

    ```bash
    docker compose build
    ```

3. Start Docker shell

    ```bash
    docker compose run shell
    ```

4. Build workspace

    ```bash
    cd /ros_workspace && colcon build
    ```

5. Source workspace

    ```bash
    source install/setup.bash
    ```

6. Run launch files

    ```bash
    ros2 launch arm_urdf_pkg robot_arm_visual.launch.py
    ```

    Note that if you haven't done exercise 1 yet, this will show an empty Rviz.