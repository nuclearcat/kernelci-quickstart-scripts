#!/bin/sh
cwd=$(pwd)
echo Kill old and setup new build docker
sudo docker stop kernelci-build
sudo docker rm kernelci-build
sudo docker run -it -v ${cwd}:/root/kernelci-quickstart --name kernelci-build kernelci/build-gcc-10_x86 /root/kernelci-quickstart/scripts/build/build_kselftest.sh

echo docker rootfs
sudo docker stop kernelci-debos
sudo docker rm kernelci-debos
sudo docker run -itd -v ${cwd}:/root/kernelci-quickstart --name kernelci-debos --device /dev/kvm --privileged kernelci/debos
sudo docker exec -it kernelci-debos /root/kernelci-quickstart/scripts/rootfs/rootfs.sh

