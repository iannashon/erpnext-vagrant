# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "semilimes/erpnext"
  config.vm.hostname = "ERPNext"
  config.vm.network "private_network", ip: "192.168.33.20"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ERPNext"
    vb.memory = "1024"
  end

  # For Windows provisioning in $HOME directory. For other OS - in /vagrant directory
  path = ('~' if /mswin|msys|mingw|cygwin|bccwin|wince|emc/ =~ RbConfig::CONFIG['host_os']) || '/vagrant'
  config.vm.provision :shell, path: "provision.sh", args: path, privileged: false

  if defined? VagrantPlugins::HostsUpdater
      config.hostsupdater.aliases = ["erpnext.dev"]
  end

end
