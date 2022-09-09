#!/bin/sh
cwd=$(pwd)
echo Kill old and setup new build docker
sudo docker stop kernelci-build
sudo docker rm kernelci-build
sudo docker run -it -v ${cwd}:/home/kernelci/kernelci-quickstart --name kernelci-build kernelci/gcc-10:x86-kselftest-kernelci /home/kernelci/kernelci-quickstart/scripts/build/build_kselftest.sh

