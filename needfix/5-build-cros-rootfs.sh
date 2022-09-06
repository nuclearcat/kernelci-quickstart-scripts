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
    kernelci/cros-sdk

docker exec \
    -it kernelci-build-cros \
    ./kci_rootfs \
    build \
    --rootfs-config chromiumos-grunt \
    --data-path config/rootfs/chromiumos \
    --arch amd64 \
    --output temp