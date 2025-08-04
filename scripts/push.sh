#!/usr/bin/env bash

set -euo pipefail

docker push lnfu/robot-prod:ubuntu22.04
docker push lnfu/robot-prod:ubuntu22.04-ros2-humble
