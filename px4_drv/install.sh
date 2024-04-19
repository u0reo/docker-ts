#!/bin/sh

# ドライバインストールに必要なDKMSとカーネルヘッダをインストール
echo '=== Install DKMS and Kernel Headers ==='
apt install -y dkms raspberrypi-kernel-headers

# ドライバのコピー先ディレクトリを作成
mkdir -p /lib/firmware /usr/src/px4_drv-0.2.1

# dockerを用いてドライバをビルド
echo && echo '=== Build Driver using Docker ==='
docker run --rm \
  -v /lib/firmware:/lib/firmware:rw \
  -v /usr/src/px4_drv-0.2.1:/usr/src/px4_drv-0.2.1:rw \
  px4_drv &&
  docker rmi px4_drv

# DKMSを使ってインストール
echo && echo '=== Install Driver using DKMS ==='
dkms add px4_drv/0.2.1
dkms install px4_drv/0.2.1

# Raspberry Pi OSのために設定を変更
# coherent_pool: 4TSを行うために4MBのメモリプールがDMA操作に使用する
# dwc_otg.host_rx_fifo_size: USBホストコントローラの受信FIFOサイズを設定
# https://kaikoma-soft.github.io/src/raspi_OS_install.html
add_config='coherent_pool=4M dwc_otg.host_rx_fifo_size=2048'
config_path='/boot/cmdline.txt'

if ! grep -q "$add_config" $config_path; then
  echo && echo '=== Add Some Config for OS ==='
  echo "$add_config" >> $config_path
fi

echo && echo 'Install Completed! The driver will be available after reboot.'
