#!/bin/sh
id
cd /home/kernelci/kernelci-quickstart/kernelci-core
# you can use also some user repository, to check someone patches
kci_build update_mirror --build-config=next --mirror=linux-mirror.git
