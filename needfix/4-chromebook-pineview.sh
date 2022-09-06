#!/bin/sh
cwd=$(pwd)
echo Kill old and setup new build docker
sudo docker stop kernelci-build
sudo docker rm kernelci-build
sudo docker run -it -v ${cwd}:/root/kernelci-quickstart --name kernelci-build kernelci/clang-13 /root/kernelci-quickstart/scripts/build/build_chromebook_fragment.sh

