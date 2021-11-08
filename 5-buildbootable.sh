#!/bin/sh
# TBD, not completed yet
echo Housekeeping...
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
echo Unpacking rootfs
xz -d rootfs.ext4.xz
cd ..
echo Starting qemu
qemu-system-x86_64 -kernel bootable/bzImage -initrd bootable/initrd.cpio.gz -drive file=bootable/rootfs.ext4,format=raw -append "root=/dev/sda1 rdinit=/bin/init console=ttyS0" -nographic
