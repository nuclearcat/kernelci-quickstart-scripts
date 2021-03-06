#!/bin/sh
sudo docker image build kernelci-core/config/docker/debos -t kernelci/debos
sudo docker image build kernelci-core/config/docker/gcc-10_x86 -t kernelci/build-gcc-10_x86
sudo docker image build kernelci-core/config/docker/gcc-10_arm -t kernelci/build-gcc-10_arm
sudo docker image build kernelci-core/config/docker/clang-13 -t kernelci/clang-13
sudo docker image build kernelci-core/config/docker/clang-14 -t kernelci/clang-14
