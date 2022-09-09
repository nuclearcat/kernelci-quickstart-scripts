#!/bin/sh
. ./secrets.cfg
cd kernelci-core
echo ${LAB_USERNAME}
echo ${LAB_TOKEN}
./kci_test get_lab_info --user=${LAB_USERNAME} --lab-config=lab-collabora --lab-token=${LAB_TOKEN} --lab-json=lab-name.json

