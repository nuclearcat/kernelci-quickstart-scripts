#!/bin/sh
#docker stop kernelci-build-cros
#docker rm kernelci-build-cros
#cd kernelci-core
#docker run \
#    --name kernelci-build-cros \
#    -it \
#    -v $(pwd):/kernelci-core \
#    --device /dev/kvm \
#    -v /dev:/dev \
#    --privileged \
#    kernelci/cros-sdk /bin/bash
#exit


#docker run \
#    --name kernelci-build-cros \
#    -itd \
#    -v $(pwd):/kernelci-core \
#    --device /dev/kvm \
#    -v /dev:/dev \
#    --privileged \
#    --user cros \
#    kernelci/cros-sdk:kernelci

docker exec \
    -it kernelci-build-cros \
    /bin/bash

docker exec \
    -it kernelci-build-cros \
    kci_rootfs \
    build \
    --rootfs-config chromiumos-nami \
    --data-path /etc/kernelci/rootfs/chromiumos \
    --arch amd64 \
    --output /kernelci-core/temp
