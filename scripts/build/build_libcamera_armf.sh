#!/bin/sh
PARAM="--settings=kernelci-armf.conf"
cd /root/kernelci-quickstart/kernelci-core
echo Update mirror
./kci_build ${PARAM} update_mirror --build-config=next --mirror=linux-mirror.git
echo Update repo
./kci_build ${PARAM} update_repo --build-config=next --mirror=linux-mirror.git
#echo Generate additional config fragments
#./kci_build ${PARAM} generate_fragments --build-config=next
echo init_bmeta
./kci_build ${PARAM} init_bmeta --build-config=next
echo make_config
./kci_build ${PARAM} make_config --defconfig=exynos_defconfig
echo make_kernel
./kci_build ${PARAM} make_kernel 
echo make_modules
./kci_build ${PARAM} make_modules
