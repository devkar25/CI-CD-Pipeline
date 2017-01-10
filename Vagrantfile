Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.box = "centos/7"
    master.vm.hostname = 'master'
    master.vm.box_url = "centos/7"
    master.vm.network :private_network, ip: "192.168.56.101"
    master.vm.network :forwarded_port, host: 2201, guest: 22, id: "ssh", auto_correct: true
    master.vm.network :forwarded_port, host: 8080, guest: 8080
    master.vm.network :forwarded_port, host: 5000, guest: 5000
    
    master.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "master"]
  end
  config.vm.provision "file", source: "master_bootstrap.sh", destination: "~/"
  config.vm.provision "shell", path: "minion_bootstrap.sh"
 # config.vm.provision "shell", inline: "sudo mkdir -p /srv/salt"
 # config.vm.provision "shell", inline: "sudo mkdir -p /etc/salt"
  config.vm.provision "file", source: "config/minions/minion", destination: "~/minion"
  config.vm.provision "file", source: "config/salt-master/master", destination: "~/master"
  config.vm.provision "shell", inline: "sudo cp /home/vagrant/*.sls /etc/salt/master"
  config.vm.provision "shell", inline: "sudo cp /home/vagrant/minion /etc/salt/minion"

  ## Use all the default
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
    end

  config.vm.define "slave" do |slave|
    slave.vm.box = "centos/7"
    slave.vm.hostname = 'slave'
    slave.vm.box_url = "centos/7"

    slave.vm.network :private_network, ip: "192.168.56.102"
    slave.vm.network :forwarded_port, host: 2202, guest: 22, id: "ssh", auto_correct: true
    slavevm.network :forwarded_port, host: 9001, guest: 9001
    slave.vm.network "private_network", ip: "192.168.50.92"
    slave.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "slave"]
    end

  config.vm.provision "shell", path: "minion_bootstrap.sh"
  config.vm.provision "file", source: "config/minions/minion", destination: "~/minion"
  config.vm.provision "shell", inline: "sudo cp /home/vagrant/minion /etc/salt/minion"

  end
end
