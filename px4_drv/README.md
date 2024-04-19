# Docker: px4_drv

PLEXなどのチューナーの非公式ドライバを環境をできる限り汚さないようビルドし、インストールするもの。

詳しくはドライバのリポジトリを参照してください。

[nns779/px4_drv: Unofficial Linux driver for PLEX PX4/PX5/PX-MLT series ISDB-T/S receivers (not V4L-DVB)](https://github.com/nns779/px4_drv)

## インストール方法

内部でaptコマンドを使用します。

```sh
sudo ./install.sh
```

## 各種確認

### モジュールの確認 (要再起動)

```sh
lsmod | grep ^px4_drv
```

### 正しくデバイスが読み込まれているか確認

```sh
dmesg | grep px4_usb
```

### デバイスが存在するか確認

```sh
ls /dev/px*
```

### インストール済みのカーネルヘッダの確認

```sh
ls /usr/src/ | grep linux-headers
```
