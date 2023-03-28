#!/bin/sh
PARAM="--settings=kernelci-x86_64-gcc-10_arm64.conf"
BUILDNAME="stable_6.0"
echo HI
ls -la
#git clone --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
cd kernelci-quickstart/kernelci-core
#find / -name __init__.py | grep kernelci
#sudo rm -rf /usr/local/lib/python3.9/dist-packages/kernelci-1.1-py3.9.egg
#/bin/bash
echo Update repo
./kci_build ${PARAM} update_repo --build-config=${BUILDNAME} --mirror=linux-mirror.git
echo generate_fragments
./kci_build ${PARAM} generate_fragments --build-config=${BUILDNAME}
echo Init BMeta
./kci_build ${PARAM} init_bmeta --build-config=${BUILDNAME}
echo make_config
#./kci_build ${PARAM} make_config --defconfig=cros://chromeos-5.15/arm64/chromiumos-mediatek.flavour.config+arm64-chromebook+CONFIG_MODULE_COMPRESS_GZIP=n
./kci_build ${PARAM} make_config --defconfig=defconfig+arm64-chromebook
echo make_dtbs
./kci_build ${PARAM} make_dtbs
echo fetch_firmware
#tar -C 
./kci_build ${PARAM} fetch_firmware
echo make_kernel
./kci_build ${PARAM} make_kernel
echo make_modules
./kci_build ${PARAM} make_modules
echo make_dtbs
./kci_build ${PARAM} make_dtbs

