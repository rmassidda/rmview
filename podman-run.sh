#!/bin/bash
set -e

CONFIG_DIR=$HOME/.config/rmview
mkdir -p $CONFIG_DIR
xhost local:root
podman build -t rmview .
podman run \
  --env DISPLAY=$DISPLAY \
  --network host \
  --volume $CONFIG_DIR:/root/.config \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --volume /dev/dri:/dev/dri \
  --security-opt=label=type:container_runtime_t \
  rmview
