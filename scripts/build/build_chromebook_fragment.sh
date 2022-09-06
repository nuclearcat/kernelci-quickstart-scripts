#!/bin/sh
PARAM="--settings=kernelci-x86_64-clang13.conf"
ls -la
#git clone --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
cd kernelci-quickstart/kernelci-core
echo Update repo
./kci_build ${PARAM} update_repo --build-config=stable_5.15 --mirror=linux-mirror.git
echo generate_fragments
./kci_build ${PARAM} generate_fragments --build-config=stable_5.15
echo Init BMeta
./kci_build ${PARAM} init_bmeta --build-config=stable_5.15
echo make_config
./kci_build ${PARAM} make_config --defconfig=cros://chromeos-5.15/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chromebook+CONFIG_MODULE_COMPRESS_GZIP=n
echo fetch_firmware
./kci_build ${PARAM} fetch_firmware
echo make_kernel
./kci_build ${PARAM} make_kernel
echo make_modules
./kci_build ${PARAM} make_modules
