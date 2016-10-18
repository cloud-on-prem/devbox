# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/wily64'

  config.vm.network 'private_network', ip: '192.168.33.10'
  config.ssh.forward_agent = true

  config.vm.synced_folder '../', '/work-space'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '4096'
    vb.cpus = 2
    vb.name = 'devbox'
    vb.customize [
      'guestproperty',
      'set',
      :id,
      '/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold',
      1000
    ]
  end
end
