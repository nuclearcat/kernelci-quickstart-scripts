#!/bin/sh
cwd=$(pwd)
echo Kill old and setup new build docker
docker stop kernelci-build
docker rm kernelci-build
docker run -it -v ${cwd}:/root/kernelci-quickstart --name kernelci-build kernelci/clang-15 /root/kernelci-quickstart/scripts/build/build_android_arm64_gki_defconfig_clang.sh
