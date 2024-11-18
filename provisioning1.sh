#!/bin/bash

# EPELリポジトリのインストール
dnf install -y epel-release

# パッケージのインストール
dnf install -y lsyncd

# 同期用ディレクトリの作成
mkdir -p /var/sync_dir/
chown taro:taro /var/sync_dir
chmod 755 /var/sync_dir/

# lsyncd設定ファイルの作成
cat << 'EOF' > /etc/lsyncd.conf
settings {
    logfile = "/var/log/lsyncd/lsyncd.log",
    statusFile = "/var/log/lsyncd/lsyncd-status.log",
    statusInterval = 1
}

-- ノード2への同期設定
sync {
    default.rsyncssh,
    source = "/var/sync_dir/",
    host = "192.168.33.22",
    targetdir = "/var/sync_dir/",
    delete="running",
    rsync = {
        archive = true,
        verbose = true,
        _extra = {"--chmod=D755,F644"}
    },
    delay = 5,
    ssh = {
        identityFile = "/root/.ssh/id_rsa",
        _extra = {"-l", "taro"}
    }
}

-- ノード3への同期設定
sync {
    default.rsyncssh,
    source = "/var/sync_dir/",
    host = "192.168.33.23",
    targetdir = "/var/sync_dir/",
    delete="running",
    rsync = {
        archive = true,
        verbose = true,
        _extra = {"--chmod=D755,F644"}
    },
    delay = 5,
    ssh = {
        identityFile = "/root/.ssh/id_rsa",
        _extra = {"-l", "taro"}
    }
}
EOF

# lsyncdのログディレクトリ作成
mkdir -p /var/log/lsyncd

# SSHキーペアの生成（パスフレーズなし）
ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa

# サービスの有効化と起動
systemctl enable lsyncd
systemctl start lsyncd

echo "以下のコマンドを実行して、各ターゲットサーバーにSSH公開鍵を配布してください："
echo "ssh-copy-id -i /root/.ssh/id_rsa.pub taro@192.168.33.22"
echo "ssh-copy-id -i /root/.ssh/id_rsa.pub taro@192.168.33.23"
