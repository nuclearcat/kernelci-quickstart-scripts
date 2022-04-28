#!/bin/sh
. ./secrets.cfg
cd kernelci-core
mkdir -p jobs
./kci_test generate \
  --db-config=localhost \
  --install-path=build-x86/_install_ \
  --lab-config=lab-collabora \
  --output=jobs \
  --storage=https://storage.chromeos.kernelci.org/\
  --user=${LAB_USERNAME} \
  --lab-token=${LAB_TOKEN} \
  --lab-json=lab-name.json \
  --plan=baseline-nfs

