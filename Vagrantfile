# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "semilimes/erpnext"
  config.vm.hostname = "ERPNext"
  config.vm.network "private_network", ip: "192.168.33.20"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision :shell, path: "provision.sh", privileged: false

  if defined? VagrantPlugins::HostsUpdater
      config.hostsupdater.aliases = ["erpnext.dev"]
  end

end
