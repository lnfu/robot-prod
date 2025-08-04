#!/usr/bin/env bash

set -euo pipefail

docker build -t lnfu/robot-prod:ubuntu22.04 ubuntu22.04
docker build -t lnfu/robot-prod:ubuntu22.04-ros2-humble ubuntu22.04-ros2-humble
