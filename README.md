# robot-prod

Unified lightweight production base Docker images for robotics and computer vision.

## Available Tags

List of tags available at https://hub.docker.com/r/lnfu/robot-prod/tags

## Build Instructions

You can build each image using the following commands:

```bash
docker build -t lnfu/robot-prod:ubuntu22.04 ubuntu22.04
docker build -t lnfu/robot-prod:ubuntu22.04-ros2-humble ubuntu22.04-ros2-humble
```

## Push to Docker Hub

After building, push the images:

```bash
docker push lnfu/robot-prod:ubuntu22.04
docker push lnfu/robot-prod:ubuntu22.04-ros2-humble
```

## License

MIT License
