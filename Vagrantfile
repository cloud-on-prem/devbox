# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.33.20"
  config.ssh.forward_agent = true

  config.vm.synced_folder "../", "/work-space"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
    vb.name = "devbox"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./stack/dev-box.yml"
    ansible.inventory_path = "./inventory"
  end
end
