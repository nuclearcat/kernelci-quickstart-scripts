#!/bin/sh
apt install git docker.io python3-setuptools build-essential -y
# For bootability check
apt install --no-install-recommends qemu-system-x86
git clone https://github.com/nuclearcat/kernelci-core.git
cp cfg/* kernelci-core/
cd kernelci-core
python3 setup.py install
