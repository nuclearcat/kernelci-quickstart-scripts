#!/bin/sh
cd /home/kernelci/kernelci-quickstart
# you can use also some user repository, to check someone patches
#git clone -b staging.kernelci.org https://github.com/kernelci/kernelci-core.git
git clone -b dev/aratiu/bump-kernel-add-cherry-support https://github.com/10ne1/kernelci-core
cp cfg/* kernelci-core/
cd kernelci-core
# optionally use branch
kci_build update_mirror --build-config=next --mirror=linux-mirror.git
mkdir temp
