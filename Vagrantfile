# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "trusty"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.hostname = "abox-0"
  config.vm.provision "file" do |f|
    f.source = "configs/mongodb.conf"
    f.destination = "/home/vagrant/mongodb.conf"
  end
  config.vm.provision "shell" do |s|
    s.path = "scripts/deploy.sh"
    s.args = ENV['TRACEVISOR_IP']
  end
  config.vm.provision "shell", path: "scripts/deploy-lttng-source.sh"
  config.vm.network "private_network", type: "dhcp"
end
