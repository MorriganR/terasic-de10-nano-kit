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

echo "apt-get update && apt-get install --no-install-recommends ubuntu-desktop -y" && \
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ubuntu-desktop

export PATH="/root/intelFPGA_lite/20.1/quartus/bin:$PATH"

echo "# env" && env

echo "# /root/intelFPGA_lite/20.1/quartus/bin/quartus_sh --version" && \
/root/intelFPGA_lite/20.1/quartus/bin/quartus_sh --version || :

echo "# quartus_sh --version"&& \
quartus_sh --version || :
