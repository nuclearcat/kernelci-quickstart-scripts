#!/bin/sh
docker stop kernelci-debos
docker rm kernelci-debos
cd kernelci-core

    echo "cd /kernelci-core;/kernelci-core/kci_rootfs \
    build \
    --rootfs-config bullseye \
    --data-path /kernelci-core/config/rootfs/debos \
    --arch amd64 \
    --output /kernelci-core/temp"

docker run \
    --name kernelci-debos \
    -it \
    -v $(pwd):/kernelci-core \
    --device /dev/kvm \
    -v /dev:/dev \
    --privileged \
    kernelci/debos 


#docker run \
#    --name kernelci-debos \
#    -itd \
#    -v $(pwd):/kernelci-core \
#    --device /dev/kvm \
#    -v /dev:/dev \
#    --privileged \
#    --user cros \
#    kernelci/cros-sdk:kernelci

#docker exec \
#    -it kernelci-debos \
#    /bin/bash
#docker exec \
#    -it kernelci-debos \
#    kci_rootfs \
#    build \
#    --rootfs-config bullseye-cros-flash \
#    --data-path /etc/kernelci/rootfs/chromiumos \
#    --arch amd64 \
#    --output /kernelci-core/temp
