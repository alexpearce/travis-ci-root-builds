# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "Ubuntu-12.04-Server-amd64"

  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  # Forward SSH X11 connections, useful for testing the ROOT GUI works
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provision "shell", path: "provisioning.sh"

  # Increase memory from 512MB default to 2048MB
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
end
