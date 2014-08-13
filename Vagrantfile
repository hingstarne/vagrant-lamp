# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/precise64"
  config.vm.box_check_update = true
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "./data", "/vagrant_data"
  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.provision :shell, :path => 'provide_puppet.sh'
  config.vm.provision :shell, :path => 'provide_modules.sh'
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path    = "manifests"
    puppet.manifest_file     = "site.pp"
    puppet.module_path       = ["modules", "local_modules"]
    puppet.options           = "--verbose --debug"
  end
end
