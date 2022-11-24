#!/bin/sh
PARAM="--settings=kernelci-x86_64-gcc-10_arm64.conf"
BUILDNAME="stable_5.19"
echo HI
ls -la
#git clone --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
cd kernelci-quickstart/kernelci-core
echo Update repo
./kci_build ${PARAM} update_repo --build-config=${BUILDNAME} --mirror=linux-mirror.git
echo generate_fragments
./kci_build ${PARAM} generate_fragments --build-config=${BUILDNAME}
echo Init BMeta
./kci_build ${PARAM} init_bmeta --build-config=${BUILDNAME}
echo make_config
./kci_build ${PARAM} make_config --defconfig=defconfig+arm64-chromebook
echo make_dtbs
./kci_build ${PARAM} make_dtbs
echo fetch_firmware
./kci_build ${PARAM} fetch_firmware
echo make_kernel
./kci_build ${PARAM} make_kernel
echo make_modules
./kci_build ${PARAM} make_modules
