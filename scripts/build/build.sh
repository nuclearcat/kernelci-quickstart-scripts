#!/bin/sh
cd /root/kernelci-quickstart/kernelci-core
./kci_build make_config --defconfig=defconfig
./kci_build make_kernel
./kci_build make_modules
