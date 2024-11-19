# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # lsyncd1 用の設定
  config.vm.define "lsyncd1" do |lsyncd1|
    lsyncd1.vm.box = "bento/almalinux-8"
    lsyncd1.vm.hostname = "lsyncd1.local"
    lsyncd1.vm.network "private_network", ip: "192.168.33.21"

    lsyncd1.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    lsyncd1.vm.provision "shell", inline: <<-SHELL
      # タイムゾーンをAsia/Tokyoに設定
      timedatectl set-timezone Asia/Tokyo

      # 基本パッケージのインストール
      dnf install -y epel-release
      dnf install -y lsyncd
      # ユーザー作成
      for user in taro jiro; do
        useradd -m $user
        echo "${user}:${user}" | chpasswd
      done

      # 共通のSSHキーを /vagrant/ssh_keys に生成（共有フォルダに保存）
      mkdir -p /vagrant/ssh_keys
      if [ ! -f /vagrant/ssh_keys/common_key ]; then
        ssh-keygen -t rsa -b 4096 -f /vagrant/ssh_keys/common_key -N ''
      fi

      # 各ユーザーのSSHディレクトリを設定
      for user in taro jiro; do
        user_home="/home/$user"
        mkdir -p ${user_home}/.ssh
        chmod 700 ${user_home}/.ssh

        # 共有フォルダから鍵をコピー
        cp /vagrant/ssh_keys/common_key ${user_home}/.ssh/id_rsa
        cp /vagrant/ssh_keys/common_key.pub ${user_home}/.ssh/id_rsa.pub
        cp /vagrant/ssh_keys/common_key.pub ${user_home}/.ssh/authorized_keys

        # 適切な権限を設定
        chmod 600 ${user_home}/.ssh/id_rsa
        chmod 644 ${user_home}/.ssh/id_rsa.pub
        chmod 600 ${user_home}/.ssh/authorized_keys
        chown -R ${user}:${user} ${user_home}/.ssh
      done

      # 同期ディレクトリの作成
      mkdir -p /var/sync_dir
      chown taro:taro /var/sync_dir
      chmod 755 /var/sync_dir
      # lsyncd設定ディレクトリの作成
      mkdir -p /home/taro/.config/lsyncd
      chown -R taro:taro /home/taro/.config

      mkdir -p /var/log/lsyncd
      chmod 777 /var/log/lsyncd

      # SELinuxをpermissiveからdisabledに設定
      sed -i 's/^SELINUX=permissive/SELINUX=disabled/' /etc/selinux/config
    SHELL
  end

  # lsyncd2 用の設定
  config.vm.define "lsyncd2" do |lsyncd2|
    lsyncd2.vm.box = "bento/almalinux-8"
    lsyncd2.vm.hostname = "lsyncd2.local"
    lsyncd2.vm.network "private_network", ip: "192.168.33.22"

    lsyncd2.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    lsyncd2.vm.provision "shell", inline: <<-SHELL
      # タイムゾーンをAsia/Tokyoに設定
      timedatectl set-timezone Asia/Tokyo

      # 基本パッケージのインストール
      dnf install -y epel-release
      dnf install -y lsyncd
      # ユーザー作成
      for user in taro jiro; do
        useradd -m -s /bin/bash $user
        echo "${user}:${user}" | chpasswd
        usermod -aG wheel $user
      done

      # 各ユーザーのSSHディレクトリを設定
      for user in taro jiro; do
        user_home="/home/$user"
        mkdir -p ${user_home}/.ssh
        chmod 700 ${user_home}/.ssh

        # 共有フォルダから鍵をコピー
        cp /vagrant/ssh_keys/common_key ${user_home}/.ssh/id_rsa
        cp /vagrant/ssh_keys/common_key.pub ${user_home}/.ssh/id_rsa.pub
        cp /vagrant/ssh_keys/common_key.pub ${user_home}/.ssh/authorized_keys

        # 適切な権限を設定
        chmod 600 ${user_home}/.ssh/id_rsa
        chmod 644 ${user_home}/.ssh/id_rsa.pub
        chmod 600 ${user_home}/.ssh/authorized_keys
        chown -R ${user}:${user} ${user_home}/.ssh
      done

      # 同期ディレクトリの作成
      mkdir -p /var/sync_dir
      chown taro:taro /var/sync_dir
      chmod 755 /var/sync_dir
      # lsyncd設定ディレクトリの作成
      mkdir -p /home/taro/.config/lsyncd
      chown -R taro:taro /home/taro/.config

      mkdir -p /var/log/lsyncd
      chmod 777 /var/log/lsyncd

      # SELinuxをpermissiveからdisabledに設定
      sed -i 's/^SELINUX=permissive/SELINUX=disabled/' /etc/selinux/config
    SHELL
  end

  # lsyncd3 用の設定
  config.vm.define "lsyncd3" do |lsyncd3|
    lsyncd3.vm.box = "bento/almalinux-8"
    lsyncd3.vm.hostname = "lsyncd3.local"
    lsyncd3.vm.network "private_network", ip: "192.168.33.23"

    lsyncd3.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    lsyncd3.vm.provision "shell", inline: <<-SHELL
      # タイムゾーンをAsia/Tokyoに設定
      timedatectl set-timezone Asia/Tokyo

      # 基本パッケージのインストール
      dnf install -y epel-release
      dnf install -y lsyncd
      # ユーザー作成
      for user in taro jiro; do
        useradd -m -s /bin/bash $user
        echo "${user}:${user}" | chpasswd
        usermod -aG wheel $user
      done

      # 各ユーザーのSSHディレクトリを設定
      for user in taro jiro; do
        user_home="/home/$user"
        mkdir -p ${user_home}/.ssh
        chmod 700 ${user_home}/.ssh

        # 共有フォルダから鍵をコピー
        cp /vagrant/ssh_keys/common_key ${user_home}/.ssh/id_rsa
        cp /vagrant/ssh_keys/common_key.pub ${user_home}/.ssh/id_rsa.pub
        cp /vagrant/ssh_keys/common_key.pub ${user_home}/.ssh/authorized_keys

        # 適切な権限を設定
        chmod 600 ${user_home}/.ssh/id_rsa
        chmod 644 ${user_home}/.ssh/id_rsa.pub
        chmod 600 ${user_home}/.ssh/authorized_keys
        chown -R ${user}:${user} ${user_home}/.ssh
      done

      # 同期ディレクトリの作成
      mkdir -p /var/sync_dir
      chown taro:taro /var/sync_dir
      chmod 755 /var/sync_dir
      # lsyncd設定ディレクトリの作成
      mkdir -p /home/taro/.config/lsyncd
      chown -R taro:taro /home/taro/.config

      mkdir -p /var/log/lsyncd
      chmod 777 /var/log/lsyncd

      # SELinuxをpermissiveからdisabledに設定
      sed -i 's/^SELINUX=permissive/SELINUX=disabled/' /etc/selinux/config
    SHELL
  end
end
