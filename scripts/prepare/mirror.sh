#!/bin/sh
cd /home/kernelci/kernelci-quickstart
# you can use also some user repository, to check someone patches
git clone https://github.com/kernelci/kernelci-core.git
cp cfg/* kernelci-core/
cd kernelci-core
# optionally use branch
# git checkout chromeos
kci_build update_mirror --build-config=next --mirror=linux-mirror.git
