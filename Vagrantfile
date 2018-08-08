# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

$install_puppet = <<-SCRIPT
rpm -ihv http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum -y install puppet-agent
puppet apply --modulepath ./modules manifests/site.pp
SCRIPT

Vagrant.configure("2") do |config|

  # config.vm.box = "lnx-rhel"
  # config.vm.box_url = "http://atf.intranet.bb.com.br/artifactory/bb-vagrant-local/lnx/rhel/lnx-rhel.json"
  
  config.vm.box = 'centos/7'

  config.vm.define "jenkins-master" do |jm|

    jm.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end

    jm.vm.network "private_network", ip: "192.168.33.10"
    jm.vm.hostname = "jenkins-master"
    jm.vm.provision "shell", inline: $install_puppet
    jm.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests/"
      puppet.manifest_file = "site.pp"
      puppet.module_path = "puppet/modules/"
    end

  end

  config.vm.define "jenkins-slave1" do |js1|

    js1.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end

    js1.vm.box = "centos/7"
    js1.vm.network "private_network", ip: "192.168.33.11"
    js1.vm.hostname = "jenkins-slave1"
    js1.vm.provision "shell", inline: $install_puppet
    # js1.vm.provision "puppet" do |puppet|
    #   puppet.manifests_path = "puppet/manifests"
    #   puppet.manifest_file = "site.pp"
    # end

  end

  config.vm.define "jenkins-slave2" do |js2|

    js2.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end

    js2.vm.box = "centos/7"
    js2.vm.network "private_network", ip: "192.168.33.11"
    js2.vm.hostname = "jenkins-slave2"
    js2.vm.provision "shell", inline: $install_puppet
    # js2.vm.provision "puppet" do |puppet|
    #   puppet.manifests_path = "puppet/manifests"
    #   puppet.manifest_file = "site.pp"
    # end

  end

end
