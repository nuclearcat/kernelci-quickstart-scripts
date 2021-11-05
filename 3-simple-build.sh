#!/bin/sh
#cd kernelci-core
#echo Update mirror
#./kci_build update_mirror --build-config=next --mirror=linux-mirror.git
#echo Update repo
#./kci_build update_repo --build-config=next --mirror=linux-mirror.git

# #Maybe i need to run this in "build docker?"
#echo Init BMeta
#./kci_build init_bmeta --build-config=next

echo Kill old and setup new build docker
docker stop kernelci-build
docker rm kernelci-build
docker run -it -v $PWD:/root/kernelci-quickstart --name kernelci-build kernelci/build-gcc-10_x86 /root/kernelci-quickstart/scripts/build/build.sh

echo docker rootfs
docker stop kernelci-debos
docker rm kernelci-debos
docker run -itd -v $(pwd):/root/kernelci-quickstart --name kernelci-debos --device /dev/kvm --privileged kernelci/debos 
docker exec -it kernelci-debos /root/kernelci-quickstart/scripts/rootfs/rootfs.sh

