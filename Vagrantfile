# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "ubuntu-lts-64"
  config.vm.forward_port "default", 80, 8080
  config.vm.share_folder("wwwroot", "/var/www/project", "../src/", :owner => "www-data")

  config.vm.provision :puppet, :module_path => "modules" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
  end
end
