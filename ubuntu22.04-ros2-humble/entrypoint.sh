#!/bin/bash
set -e

if [ -f "/opt/ros/$ROS_DISTRO/setup.bash" ]; then
    source "/opt/ros/$ROS_DISTRO/setup.bash"
fi

if [ -f "/workspace/install/setup.bash" ]; then
    source "/workspace/install/setup.bash"
fi

exec "$@"
