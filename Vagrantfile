Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.define "eip" do |d| 
    d.vm.box = "centos/7" 
    d.vm.hostname = "eip"
#    d.vm.network "public_network", bridge: "eno4", ip: "192.168.57.27", auto_config: "false", netmask: "255.255.255.0" , gateway: "192.168.57.1"
    d.vm.network "private_network", ip: "10.100.198.200"
    d.vm.provision :shell, path: "scripts/bootstrap4CentOs_ansible.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/eip.yml -c local"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
