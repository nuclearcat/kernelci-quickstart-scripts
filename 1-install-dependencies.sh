#!/bin/sh
sudo apt install git docker.io python3-setuptools python3-pip build-essential -y
# For bootability check
sudo apt install --no-install-recommends qemu-system-x86

# You can use your own fork of kernelci and branch, for testing PR
git clone https://github.com/kernelci/kernelci-core.git
# Custom branch (optional)
git checkout chromeos

cp cfg/* kernelci-core/
cd kernelci-core
sudo pip install .
#sudo python3 setup.py install
