#!/bin/bash

# lsyncd設定ファイルの作成
cat << 'EOF' > /etc/lsyncd.conf
settings {
    logfile = "/var/log/lsyncd/lsyncd.log",
    statusFile = "/var/log/lsyncd/lsyncd-status.log",
    statusInterval = 1,
    insist = true,
    maxProcesses = 1
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
        _extra = {"--chmod=Du=rwx,Dg=rx,Do=rx,Fu=rw,Fg=r,Fo=r"}
    },
    delay = 5,
    ssh = {
        identityFile = "/home/taro/.ssh/id_rsa",
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
        _extra = {"--chmod=Du=rwx,Dg=rx,Do=rx,Fu=rw,Fg=r,Fo=r"}
    },
    delay = 5,
    ssh = {
        identityFile = "/home/taro/.ssh/id_rsa",
        _extra = {"-l", "taro"}
    }
}
EOF

# サービス設定ファイルを作成
cat << 'EOF' > /etc/systemd/system/lsyncd.service
[Unit]
Description=Live Syncing (Mirror) Daemon
After=network.target

[Service]
Type=simple
User=taro
Group=taro
Environment=HOME=/home/taro
ExecStart=/usr/bin/lsyncd -nodaemon /etc/lsyncd.conf
ExecReload=/bin/kill -HUP $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# サービスの再読み込み
systemctl daemon-reload
systemctl enable lsyncd

echo "以下のコマンドを実行して、各ターゲットサーバーへ ssh 接続できることを確認してください"
echo "sudo -u taro ssh -i /home/taro/.ssh/id_rsa taro@192.168.33.22"
echo "sudo -u taro ssh -i /home/taro/.ssh/id_rsa taro@192.168.33.23"
echo "上記コマンドで接続確認後、以下のコマンドを実行してください"
echo "sudo systemctl start lsyncd"
