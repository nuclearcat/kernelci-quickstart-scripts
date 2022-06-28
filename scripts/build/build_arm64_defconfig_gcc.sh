#!/bin/sh
CFG="mainline"
PARAM="--settings=kernelci-sparc64-gcc10.conf"

cd /root/kernelci-quickstart/kernelci-core
echo Update repo
./kci_build ${PARAM} update_repo --build-config=${CFG} --mirror=linux-mirror.git
echo generate_fragments
./kci_build ${PARAM} generate_fragments --build-config=${CFG}
echo Init BMeta
./kci_build ${PARAM} init_bmeta --build-config=${CFG}
echo make_config
./kci_build ${PARAM} make_config --defconfig=sparc64_defconfig
echo make_kernel
./kci_build ${PARAM} make_kernel
echo make_modules
./kci_build ${PARAM} make_modules
