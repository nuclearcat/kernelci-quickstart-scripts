#!/bin/sh
set -xe
PARAM="--settings=../cfg/kernelci-x86_64-clang13.conf"
cd /home/kernelci/kernelci-quickstart/kernelci-core
ls -la /usr/local/bin/kci_build
echo pull_tarball
./kci_build pull_tarball --url http://storage.staging.kernelci.org/kernelci/staging-next/staging-next-20221218.0/linux-src_kernelci_staging-next.tar.gz --retries 3 --delete
echo Update repo
./kci_build ${PARAM} update_repo --build-config=stable_5.15 --mirror=linux-mirror.git
echo generate_fragments
./kci_build ${PARAM} generate_fragments --build-config=stable_5.15
echo Init BMeta
./kci_build ${PARAM} init_bmeta --build-config=stable_5.15
echo make_config
./kci_build ${PARAM} make_config --defconfig=cros://chromeos-5.15/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chromebook+CONFIG_MODULE_COMPRESS_GZIP=n
#exit
echo fetch_firmware
./kci_build ${PARAM} fetch_firmware
echo make_kernel
./kci_build ${PARAM} make_kernel
echo make_modules
./kci_build ${PARAM} make_modules
