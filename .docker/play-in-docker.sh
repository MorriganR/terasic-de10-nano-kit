#!/usr/bin/env bash

set -e

echo "# df -h" && df -h
echo "# pwd" && pwd

echo "# cd /usr/src/de10nano" && cd /usr/src/de10nano
echo "# ls -la" && ls -la

echo "# cd /root/intelFPGA_lite/20.1/quartus/bin" && cd /root/intelFPGA_lite/20.1/quartus/bin
echo "# ls -la" && ls -la
#echo "# du -h ./" && du -h ./
#echo "# ls -hlaR" && ls -hlaR

echo "# env" && env

apt-get update && apt-get install -y libtcmalloc-minimal4 libglib2.0-0

#echo "apt-get update && apt-get install --no-install-recommends ubuntu-desktop -y" && \
#apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ubuntu-desktop


export Q_INST_DIR=/root/intelFPGA_lite/20.1

export QUARTUS_ROOTDIR=${Q_INST_DIR}/quartus
export QUARTUS_ROOTDIR_OVERRIDE=${Q_INST_DIR}/quartus
export SOPC_KIT_NIOS2=${Q_INST_DIR}/nios2eds

export PATH=${Q_INST_DIR}/quartus/sopc_builder/bin/:$PATH
export PATH=${Q_INST_DIR}/quartus/bin/:$PATH
export PATH=${Q_INST_DIR}/nios2eds/:$PATH
export PATH=${Q_INST_DIR}/nios2eds/bin/:$PATH
export PATH=${Q_INST_DIR}/nios2eds/sdk2/bin/:$PATH
export PATH=${Q_INST_DIR}/nios2eds/bin/gnu/H-x86_64-pc-linux-gnu/bin/:$PATH
export PATH=${Q_INST_DIR}/quartus/linux64/gnu/:$PATH

echo "# env" && env

echo "# /root/intelFPGA_lite/20.1/quartus/bin/quartus_sh --version" && \
/root/intelFPGA_lite/20.1/quartus/bin/quartus_sh --version || :

echo "# quartus_sh --version"&& \
quartus_sh --version || :

cd /usr/src/de10nano/tutorials/MyFirstFPGA
echo "# pwd" && pwd
echo "# ls -la" && ls -la
echo "# ./build_example.sh"
./build_example.sh || :
echo "# ls -hlaR ./blink" && ls -hlaR ./blink
cat ./blink/db/blink.db_info
cd ./blink

quartus_sh --flow compile blink || :

echo "# pwd" && pwd
echo "# ls -hlaR" && ls -hlaR
