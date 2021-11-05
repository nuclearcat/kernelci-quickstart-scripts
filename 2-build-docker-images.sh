#!/bin/sh
docker image build kernelci-core/config/docker/debos -t kernelci/debos
docker image build kernelci-core/config/docker/gcc-10_x86 -t kernelci/build-gcc-10_x86
