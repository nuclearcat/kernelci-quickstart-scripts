#!/bin/sh
cwd=$(pwd)
kernelci-core
echo Update mirror
./kci_build update_mirror --build-config=next --mirror=linux-mirror.git
