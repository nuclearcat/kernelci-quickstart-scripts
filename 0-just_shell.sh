#!/bin/sh
cwd=$(pwd)
echo docker rootfs
docker stop kernelci-debos
docker rm kernelci-debos
docker run -itd -v ${cwd}:/root/kernelci-quickstart --name kernelci-debos --device /dev/kvm --privileged kernelci/debos
docker exec -it kernelci-debos /bin/sh

