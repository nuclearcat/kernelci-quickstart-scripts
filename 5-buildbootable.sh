#!/bin/sh
# TBD, not completed yet

# TODO check if exists?
rm -rf bootable
mkdir bootable
echo Copy compiled stuff
cp kernelci-core/build-x86/_install_/kernel/bzImage bootable
cp kernelci-core/build-x86/_install_/modules.tar.xz bootable
#cp kernelci-core/config/rootfs/debos/buster/amd64/rootfs.cpio.gz bootable
cp kernelci-core/config/rootfs/debos/buster/amd64/rootfs.ext4.xz bootable
cp kernelci-core/config/rootfs/debos/buster/amd64/initrd.cpio.gz bootable
echo Repack modules to initrd
cd bootable
tar -xf modules.tar.xz
find lib/ | cpio -ov -H newc -F modules.cpio
gzip -d initrd.cpio.gz
cat modules.cpio >>initrd.cpio
gzip -1 initrd.cpio

qemu-system-x86_64-spice -kernel bzImage -initrd initrd.cpio.gz -drive file=rootfs.ext4,format=raw -append "root=/dev/sda1 rdinit=/bin/init console=ttyS0"
