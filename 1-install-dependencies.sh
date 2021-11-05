#!/bin/sh
apt install git docker.io python3-setuptools -y
git clone https://github.com/kernelci/kernelci-core.git
cp cfg/kernelci.conf kernelci-core/
cd kernelci-core
python3 setup.py install
