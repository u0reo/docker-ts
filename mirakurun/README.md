# Docker: mirakurun

## 初期化

```sh
./init.sh tuner_model
```

## 追加済みチューナーリスト(tuner_model)

- dtv02_1t1s
- dtv02_4ts
- px_mlt5
- px_mlt8
- px_q3
- px_w3

## テスト

事前にmirakurunコンテナを停止

### B-CASカード

```sh
docker rmi ... mirakurun:0.1 sh -c "pcscd && pcsc_scan -t 5"
```

### 録画テスト

```sh
docker rmi ... mirakurun:0.1 sh -c "pcscd && recpt1 --b25 --device /dev/px4video2 --strip 22 5 -" > test.ts
```

## 参考

[recpt1 で Cannot start b25 decoder - Qiita](https://qiita.com/nanbuwks/items/4b26ce36d07824411633)
