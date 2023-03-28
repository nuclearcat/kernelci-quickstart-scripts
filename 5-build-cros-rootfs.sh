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
    -v $(pwd)/config:/etc/kernelci \
    --privileged \
    --user cros \
    kernelci/cros-sdk:kernelci

# Execute something manually?
#docker exec \
#    -it kernelci-build-cros \
#    /bin/bash
#exit

# if argument set
if [ -n "$1" ]; then
    brd = $1
    echo building $brd
fi

echo building ${brd}
docker exec \
    kernelci-build-cros \
    bash -c "cd /kernelci-core;
    ./kci_rootfs \
    build \
    --rootfs-config chromiumos-${brd} \
    --data-path /kernelci-core/config/rootfs/chromiumos \
    --arch amd64 \
    --output /kernelci-core/temp
    "
