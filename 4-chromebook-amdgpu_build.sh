#!/bin/sh
cwd=$(pwd)
echo Kill old and setup new build docker
docker stop kernelci-build
docker rm kernelci-build
docker run -it -v ${cwd}:/root/kernelci-quickstart --name kernelci-build kernelci/build-gcc-10_x86 /root/kernelci-quickstart/scripts/build/build_chromebook_fragment.sh

echo docker rootfs
docker stop kernelci-debos
docker rm kernelci-debos
docker run -itd -v ${cwd}:/root/kernelci-quickstart --name kernelci-debos --device /dev/kvm --privileged kernelci/debos
docker exec -it kernelci-debos /root/kernelci-quickstart/scripts/rootfs/rootfs.sh

