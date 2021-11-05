#!/bin/sh
cwd=$(pwd)
docker stop kernelci-build
docker rm kernelci-build
docker run -it -v ${cwd}:/root/kernelci-quickstart --name kernelci-build kernelci/build-gcc-10_arm /root/kernelci-quickstart/scripts/build/build_libcamera_armf.sh

echo docker rootfs
docker stop kernelci-debos
docker rm kernelci-debos
docker run -itd -v ${cwd}:/root/kernelci-quickstart --name kernelci-debos --device /dev/kvm --privileged kernelci/debos
docker exec -it kernelci-debos /root/kernelci-quickstart/scripts/rootfs/rootfs.sh

