#!/bin/sh
sudo apt install git docker.io python3-setuptools python3-pip build-essential -y
# For bootability check
sudo apt install --no-install-recommends qemu-system-x86
git clone https://github.com/nuclearcat/kernelci-core.git
cp cfg/* kernelci-core/
cd kernelci-core
sudo python3 setup.py install
