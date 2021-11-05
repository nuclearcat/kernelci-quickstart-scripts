#!/bin/sh
cd /root/kernelci-quickstart/kernelci-core
echo Update mirror
./kci_build update_mirror --build-config=next --mirror=linux-mirror.git
echo Update repo
./kci_build update_repo --build-config=next --mirror=linux-mirror.git
echo generate_fragments
./kci_build generate_fragments --build-config=next
echo Init BMeta
./kci_build init_bmeta --build-config=next
echo make_config
./kci_build make_config --defconfig=x86_64_defconfig+x86-chromebook
echo make_kernel
./kci_build make_kernel
echo make_modules
./kci_build make_modules
