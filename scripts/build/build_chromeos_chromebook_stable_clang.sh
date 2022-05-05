#!/bin/sh
#PARAM="--settings=kernelci-x86_64-clang15.conf"
PARAM="--settings=kernelci-x86_64-clang13.conf"
cd /root/kernelci-quickstart/kernelci-core
echo Update repo
./kci_build ${PARAM} update_repo --build-config=stable-rc_5.15 --mirror=linux-mirror.git
echo generate_fragments
./kci_build ${PARAM} generate_fragments --build-config=stable-rc_5.15
echo Init BMeta
./kci_build ${PARAM} init_bmeta --build-config=stable-rc_5.15
echo make_config
./kci_build ${PARAM} make_config --defconfig=cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook
echo make_kernel
./kci_build ${PARAM} make_kernel
echo make_modules
./kci_build ${PARAM} make_modules
