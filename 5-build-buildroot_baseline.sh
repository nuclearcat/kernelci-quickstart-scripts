#!/bin/sh
docker stop kernelci-buildroot
docker rm kernelci-buildroot
cd kernelci-core

echo "cd /kernelci-core;/kernelci-core/kci_rootfs \
build \
--rootfs-config buildroot-baseline \
--data-path /kernelci-core/config/rootfs/buildroot \
--arch x86 \
--output /kernelci-core/temp"

docker run \
    --name kernelci-buildroot \
    -it \
    -v $(pwd):/kernelci-core \
    --device /dev/kvm \
    -v /dev:/dev \
    --privileged \
    kernelci/buildroot


#docker run \
#    --name kernelci-buildroot \
#    -itd \
#    -v $(pwd):/kernelci-core \
#    --device /dev/kvm \
#    -v /dev:/dev \
#    --privileged \
#    --user cros \
#    kernelci/cros-sdk:kernelci

#docker exec \
#    -it kernelci-buildroot \
#    /bin/bash
#docker exec \
#    -it kernelci-buildroot \
#    kci_rootfs \
#    build \
#    --rootfs-config bullseye-cros-flash \
#    --data-path /etc/kernelci/rootfs/chromiumos \
#    --arch amd64 \
#    --output /kernelci-core/temp
