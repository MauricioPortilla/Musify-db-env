# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-18.04"
  config.vm.define "Musify-db-env"
  config.vm.hostname = "Musify-db-env"

  # config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "public_network", ip: "192.168.1.25"


  config.vm.synced_folder "./data", "/home/vagrant/"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
  end
  
  config.vm.provision :shell, privileged: false, run: 'once', path: 'provision/box_setup.sh', keep_color: true
end
