#!/bin/sh
cwd=$(pwd)
echo Kill old and setup new build docker
sudo docker stop kernelci-build
sudo docker rm kernelci-build
#sudo docker run -it -v ${cwd}:/home/kernelci/kernelci-quickstart --name kernelci-build kernelci/clang-14:kselftest-kernelci /home/kernelci/kernelci-quickstart/scripts/build/build_chromebook_fragment_amdstoney.sh
sudo docker run -it -v ${cwd}:/home/kernelci/kernelci-quickstart --name kernelci-build kernelci/staging-clang-16:kselftest-kernelci /home/kernelci/kernelci-quickstart/scripts/build/build_chromebook_fragment_amdstoney.sh
#kernelci/staging-clang-16:kselftest-kernelci

#kernelci/clang-14:kselftest-kernelci