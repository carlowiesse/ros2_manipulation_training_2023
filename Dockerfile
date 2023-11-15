ARG ROS_DISTRO

FROM carlowiesse/ros:${ROS_DISTRO}-sim as overlay

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

# Set up workspace
WORKDIR /ros_workspace/src
COPY repos.txt .
RUN vcs import < repos.txt

# Download the dependencies for this workspace
WORKDIR /ros_workspace
RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
 && apt-get update \
 && rosdep install -r -y --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} \
 && rm -rf /var/lib/apt/lists/*

# Remove reference workspace
WORKDIR /
RUN rm -rf /ros_workspace

FROM overlay as dev

ARG USERNAME
ARG UID=1000
ARG GID=${UID}
 
# Install extra tools for development
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    net-tools \
    ranger \
    vim \
 && rm -rf /var/lib/apt/lists/*
 
# Create new user and home directory
RUN groupadd --gid ${GID} ${USERNAME} \
 && useradd --uid ${GID} --gid ${UID} --create-home ${USERNAME} \
 && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
 && chmod 0440 /etc/sudoers.d/${USERNAME} \
 && mkdir -p /home/${USERNAME} \
 && chown -R ${UID}:${GID} /home/${USERNAME}
 
# Set the user and source entrypoint in the user's .bashrc file
USER ${USERNAME}
RUN echo "source /ros_entrypoint.sh" >> /home/${USERNAME}/.bashrc
