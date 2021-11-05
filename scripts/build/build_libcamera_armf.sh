#!/bin/sh
cd /root/kernelci-quickstart/kernelci-core
echo Update mirror
./kci_build --settings=kernelci-armf.conf update_mirror --build-config=next --mirror=linux-mirror.git
echo Update repo
./kci_build --settings=kernelci-armf.conf update_repo --build-config=next --mirror=linux-mirror.git
echo Generate additional config fragments
./kci_build --settings=kernelci-armf.conf generate_fragments --build-config=next
echo init_bmeta
./kci_build --settings=kernelci-armf.conf init_bmeta --build-config=next
echo make_config
./kci_build --settings=kernelci-armf.conf make_config --defconfig=exynos_defconfig
echo make_kernel
./kci_build --settings=kernelci-armf.conf make_kernel 
echo make_modules
./kci_build --settings=kernelci-armf.conf make_modules
