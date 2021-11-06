#!/bin/sh
cwd=$(pwd)
cd kernelci-core
echo Update mirror
./kci_build update_mirror --build-config=next --mirror=linux-mirror.git
