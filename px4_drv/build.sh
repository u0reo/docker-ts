#!/bin/sh

cd /tmp
git clone https://github.com/nns779/px4_drv.git
cd px4_drv/fwtool/
make -j$(nproc)

curl -fsSLo /tmp/pxw3u4_BDA_ver1x64.zip http://plex-net.co.jp/plex/pxw3u4/pxw3u4_BDA_ver1x64.zip
unzip -oj /tmp/pxw3u4_BDA_ver1x64.zip pxw3u4_BDA_ver1x64/PXW3U4.sys
./fwtool PXW3U4.sys it930x-firmware.bin

cp it930x-firmware.bin /lib/firmware/
cp -a /tmp/px4_drv /usr/src/px4_drv-0.2.1
