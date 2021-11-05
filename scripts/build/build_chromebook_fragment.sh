#!/bin/sh
cd /root/kernelci-quickstart/kernelci-core
echo make_config
./kci_build make_config --defconfig=x86_64_defconfig+x86-chromebook
echo make_kernel
./kci_build make_kernel
echo make_modules
./kci_build make_modules
