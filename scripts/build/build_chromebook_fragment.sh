#!/bin/sh
PARAM="--settings=kernelci-x86_64.conf"
cd /root/kernelci-quickstart/kernelci-core
echo Update repo
./kci_build ${PARAM} update_repo --build-config=next --mirror=linux-mirror.git
echo generate_fragments
./kci_build ${PARAM} generate_fragments --build-config=next
echo Init BMeta
./kci_build ${PARAM} init_bmeta --build-config=next
echo make_config
./kci_build ${PARAM} make_config --defconfig=x86_64_defconfig+x86-chromebook
echo make_kernel
./kci_build ${PARAM} make_kernel
echo make_modules
./kci_build ${PARAM} make_modules
