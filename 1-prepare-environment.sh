#!/bin/sh
# Might need clean up
sudo apt install git docker.io python3-setuptools python3-pip build-essential -y
# sudo apt install --no-install-recommends qemu-system-x86

cwd=$(pwd)
echo Kill old and setup new build docker
sudo docker stop kernelci-build
sudo docker rm kernelci-build

sudo docker run -it -v ${cwd}:/home/kernelci/kernelci-quickstart --name kernelci-build kernelci/kernelci /home/kernelci/kernelci-quickstart/scripts/prepare/mirror.sh
mkdir -p kernelci-core/temp
chown -R 996 kernelci-core
