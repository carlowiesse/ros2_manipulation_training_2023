#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"

# setup workspace
if [ -f /ros_workspace/install/setup.bash ]; then
  source "/ros_workspace/install/setup.bash"
fi

exec "$@"