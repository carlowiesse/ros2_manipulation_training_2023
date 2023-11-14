ARG ROS_DISTRO

FROM carlowiesse/ros:${ROS_DISTRO}-sim

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

# Set up workspace
WORKDIR /ros_workspace/src
COPY repos.txt .
RUN vcs import < repos.txt \
 && rm -rf manipulation_training/students_copy/

# Build workspace
WORKDIR /ros_workspace
RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
 && apt-get update \
 && rosdep install -r -y --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} \
 && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release \
 && rm -rf /var/lib/apt/lists/*

# Set up entrypoint
WORKDIR /
COPY ros_entrypoint.sh .
ENTRYPOINT ["/ros_entrypoint.sh"]
