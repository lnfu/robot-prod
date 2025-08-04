FROM lnfu/robot-prod:ubuntu22.04

# Set locale environment variables (needed at runtime)
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    ROS_DISTRO=humble

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    # Install essential tools and locale without interactive prompts
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    locales \
    curl \
    ca-certificates \
    gnupg \
    lsb-release \
    jq \
    && locale-gen en_US.UTF-8 \
    \
    # Enable the universe repository
    && echo "deb http://archive.ubuntu.com/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) universe" \
    > /etc/apt/sources.list.d/universe.list \
    \
    # Fetch the latest ros-apt-source release and install it
    && ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest \
    | jq -r .tag_name) \
    && curl -L -o /tmp/ros2-apt-source.deb \
    "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb" \
    && dpkg -i /tmp/ros2-apt-source.deb \
    && rm /tmp/ros2-apt-source.deb \
    \
    # Update package lists again (ROS apt source just added)
    && DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    # Install ROS Humble base packages without interactive prompts
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ros-humble-ros-base \
    \
    # Clean up to reduce image size
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]

CMD ["bash"]
