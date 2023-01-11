#!/bin/sh
docker stop kernelci-build-cros
docker rm kernelci-build-cros
cd kernelci-core
docker run \
    --name kernelci-build-cros \
    -itd \
    -v $(pwd):/kernelci-core \
    --device /dev/kvm \
    -v /dev:/dev \
    --privileged \
    --user cros \
    kernelci/cros-sdk

docker exec \
    -it kernelci-build-cros \
    /bin/bash

docker exec \
    -it kernelci-build-cros \
    bash -c 'cd /kernelci-core;
    ./kci_rootfs \
    build \
    --rootfs-config chromiumos-trogdor \
    --data-path /kernelci-core/config/rootfs/chromiumos \
    --arch arm64 \
    --output /kernelci-core/temp
    '
