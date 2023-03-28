#!/bin/sh
# Might need clean up
sudo apt install git docker.io python3-setuptools python3-pip build-essential -y
# sudo apt install --no-install-recommends qemu-system-x86

cwd=$(pwd)
echo Kill old and setup new build docker
sudo docker stop kernelci-build
sudo docker rm kernelci-build

# if kernelci-core exist - stop
if [ -d "kernelci-core" ]; then
    echo "kernelci-core exist"
    exit 1
fi


# if argument set to kernel
if [ "$1" = "kernel" ]; then
    echo "Building kernel"
    UID=1000
else
    echo "Building rootfs"
    UID=996
fi
cd ../
chown -R ${UID} kernelci-quickstart-scripts
cd -
#git clone -b staging.kernelci.org https://github.com/kernelci/kernelci-core.git
git clone -b chromeos https://github.com/kernelci/kernelci-core.git
#git clone -b dev/aratiu/bump-kernel-add-cherry-support https://github.com/10ne1/kernelci-core
cp cfg/* kernelci-core/
chown -R ${UID} kernelci-core
if [ "$1" = "kernel" ]; then
    sudo docker run -it -v ${cwd}:/home/kernelci/kernelci-quickstart --name kernelci-build kernelci/kernelci /home/kernelci/kernelci-quickstart/scripts/prepare/mirror.sh
fi
mkdir -p kernelci-core/temp
chown -R ${UID} kernelci-core/temp
