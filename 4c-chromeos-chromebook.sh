#!/bin/sh
cwd=$(pwd)
echo Kill old and setup new build docker
docker stop kernelci-build
docker rm kernelci-build
#docker run -it -v ${cwd}:/root/kernelci-quickstart --name kernelci-build kernelci/clang-15 /root/kernelci-quickstart/scripts/build/build_chromeos_chromebook_next_clang.sh
docker run -it -v ${cwd}:/root/kernelci-quickstart --name kernelci-build kernelci/clang-15 /root/kernelci-quickstart/scripts/build/build_chromeos_chromebook_stable_clang.sh
