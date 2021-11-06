#!/bin/sh
PARAM="--settings=kernelci-x86_64.conf"
cd /root/kernelci-quickstart/kernelci-core
echo Update mirror
./kci_build ${PARAM} update_mirror --build-config=next --mirror=linux-mirror.git
echo Update repo
./kci_build ${PARAM} update_repo --build-config=next --mirror=linux-mirror.git
echo Init BMeta
./kci_build ${PARAM} init_bmeta --build-config=next
echo make_config
./kci_build ${PARAM} make_config --defconfig=defconfig
echo make_kernel
./kci_build ${PARAM} make_kernel
echo make_modules
./kci_build ${PARAM} make_modules
