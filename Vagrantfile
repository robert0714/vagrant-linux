Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  config.vm.define "eip" do |d| 
    d.vm.box = "centos/7" 
#    d.vm.box ="ubuntu/trusty64" 
    d.vm.hostname = "eip"
#    d.vm.network "public_network", bridge: "eno4", ip: "192.168.57.27", auto_config: "false", netmask: "255.255.255.0" , gateway: "192.168.57.1"
    d.vm.network "private_network", ip: "10.100.198.200"
#   ubuntu' default gateway had problem on Vagrant
#    default_router = "192.168.57.1"
#    d.vm.provision :shell, inline: "ip route delete default 2>&1 >/dev/null || true; ip route add default via #{default_router}" 
#    d.vm.provision :shell, path: "scripts/bootstrap_ansible.sh"
    d.vm.provision :shell, path: "scripts/bootstrap4CentOs_ansible.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/cd.yml -c local"
    d.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
  end
  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
#  if Vagrant.has_plugin?("vagrant-vbguest")
#    config.vbguest.auto_update = false
#    config.vbguest.no_install = false
#    config.vbguest.no_remote = false
#  end
end
