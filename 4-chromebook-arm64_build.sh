#!/bin/sh
cwd=$(pwd)
chown -R 1000 kernelci-core
echo Kill old and setup new build docker
sudo docker stop kernelci-build
sudo docker rm kernelci-build

rm -rf kernelci-core/build-arm64
mkdir -p kernelci-core/build-arm64
cp .config kernelci-core/build-arm64
chown -R builder kernelci-core/build-arm64
#sudo docker run -it -v ${cwd}:/home/kernelci/kernelci-quickstart --name kernelci-build kernelci/gcc-10:arm64-kselftest-kernelci /home/kernelci/kernelci-quickstart/scripts/build/build_chromebook_fragment_arm64.sh mediatek
sudo docker run -it -v ${cwd}:/home/kernelci/kernelci-quickstart --name kernelci-build kernelci/gcc-10:arm64-kselftest-kernelci /home/kernelci/kernelci-quickstart/scripts/build/build_chromebook_fragment_arm64.sh qualcomm

rm -rf /var/www/html/next
mkdir -p /var/www/html/next
cp -r kernelci-core/build-arm64/_install_/* /var/www/html/next
