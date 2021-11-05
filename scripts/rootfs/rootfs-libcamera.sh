#!/bin/sh
cd /root/kernelci-quickstart/kernelci-core
./kci_rootfs build --rootfs-config buster-libcamera --data-path config/rootfs/debos --arch armf
# ./kci_rootfs build --rootfs-config buster-libcamera --arch armhf --data-path config/rootfs/debos

