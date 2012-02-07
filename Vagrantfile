# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "lucid32"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.forward_port "webserver", 80, 8080
  config.vm.share_folder("wwwroot", "/home/app/public_html", "../src/", :owner => "app")
  
  config.vm.customize do |vm|
	vm.memory_size = 512
	vm.name = "FLOW3"
  end
  

  config.vm.provision :puppet, :module_path => "modules" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
  end
end
