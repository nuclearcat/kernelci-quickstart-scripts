#!/bin/sh
cd /root/kernelci-quickstart/kernelci-core
./kci_rootfs build --rootfs-config buster --data-path config/rootfs/debos --arch amd64
