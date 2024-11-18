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
      # ユーザー作成とwheelグループ設定
      for user in taro jiro; do
        useradd -m -s /bin/bash $user
        echo "${user}:${user}" | chpasswd
        usermod -aG wheel $user
      done

      # SSHディレクトリの作成と権限設定
      for user in taro jiro; do
        user_home="/home/$user"
        mkdir -p ${user_home}/.ssh
        chmod 700 ${user_home}/.ssh
        touch ${user_home}/.ssh/authorized_keys
        chmod 600 ${user_home}/.ssh/authorized_keys
        chown -R ${user}:${user} ${user_home}/.ssh
      done

      # SSHの設定
      sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
      systemctl restart sshd

      # SELinuxをpermissiveからdisabledに設定
      sed -i 's/^SELINUX=permissive/SELINUX=disabled/' /etc/selinux/config
      shutdown -r now
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
      # ユーザー作成とwheelグループ設定
      for user in taro jiro; do
        useradd -m -s /bin/bash $user
        echo "${user}:${user}" | chpasswd
        usermod -aG wheel $user
      done

      # SSHディレクトリの作成と権限設定
      for user in taro jiro; do
        user_home="/home/$user"
        mkdir -p ${user_home}/.ssh
        chmod 700 ${user_home}/.ssh
        touch ${user_home}/.ssh/authorized_keys
        chmod 600 ${user_home}/.ssh/authorized_keys
        chown -R ${user}:${user} ${user_home}/.ssh
      done

      # SSHの設定
      sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
      systemctl restart sshd

      # SELinuxをpermissiveからdisabledに設定
      sed -i 's/^SELINUX=permissive/SELINUX=disabled/' /etc/selinux/config
      shutdown -r now
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
      # ユーザー作成とwheelグループ設定
      for user in taro jiro; do
        useradd -m -s /bin/bash $user
        echo "${user}:${user}" | chpasswd
        usermod -aG wheel $user
      done

      # SSHディレクトリの作成と権限設定
      for user in taro jiro; do
        user_home="/home/$user"
        mkdir -p ${user_home}/.ssh
        chmod 700 ${user_home}/.ssh
        touch ${user_home}/.ssh/authorized_keys
        chmod 600 ${user_home}/.ssh/authorized_keys
        chown -R ${user}:${user} ${user_home}/.ssh
      done

      # SSHの設定
      sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
      systemctl restart sshd

      # SELinuxをpermissiveからdisabledに設定
      sed -i 's/^SELINUX=permissive/SELINUX=disabled/' /etc/selinux/config
      shutdown -r now
    SHELL
  end
end
