#!/bin/sh
cd /root/kernelci-quickstart/kernelci-core
echo Update mirror
./kci_build update_mirror --build-config=next --mirror=linux-mirror.git
echo Update repo
./kci_build update_repo --build-config=next --mirror=linux-mirror.git
echo Init BMeta
./kci_build init_bmeta --build-config=next
echo make_config
./kci_build make_config --defconfig=defconfig
echo make_kernel
./kci_build make_kernel
echo make_modules
./kci_build make_modules
