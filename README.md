# lsyncd_test
lsyncd の勉強用

## ノードの構成
- lsyncd1: 192.168.33.21
- lsyncd2: 192.168.33.22
- lsyncd3: 192.168.33.23

## ノードのユーザー
- taro
- jiro

## ノードのSSHキー
- 共有フォルダにある `ssh_keys` ディレクトリをマウントしている

# 環境構築手順
1. `vagrant up` する
2. `vagrant reload` する（SELinuxを無効にするため）
3. lsyncd1 で root になった後、 `/vagrant/provisioning1.sh` を実行する
4. lsyncd2 で root になった後、 `/vagrant/provisioning2.sh` を実行する
5. lsyncd3 で root になった後、 `/vagrant/provisioning3.sh` を実行する
6. それぞれで provisioning スクリプトを実行した後、それぞれ `sudo systemctl start lsyncd` を実行すると同期が開始される
