Vagrant.configure("2") do |config|
  config.vm.box = "in2it-testbox"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.hostname = "in2it-testbox"

  config.vm.network :private_network, ip: "192.168.56.101"

  config.vm.synced_folder ".", "/srv/www", owner: 'www-data', group: 'www-data', :mount_options => ['dmode=777','fmode=777']

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "config/puppet"
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

end