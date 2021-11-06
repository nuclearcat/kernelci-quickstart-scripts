#!/bin/sh
apt install git docker.io python3-setuptools build-essential -y
git clone https://github.com/kernelci/kernelci-core.git
cp cfg/* kernelci-core/
cd kernelci-core
python3 setup.py install
