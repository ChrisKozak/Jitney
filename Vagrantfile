Vagrant::Config.run do |config|
  # If you are unfamiliar with Vagrant, online documentation is at vagrantup.com.

  config.vm.box = "base"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 28017, 28017

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "Jitney-Project", "/home/vagrant/Jitney", "Jitney"

  config.vm.provision :puppet do |puppet|
   puppet.manifests_path = "manifests"
   puppet.manifest_file  = "base.pp"
  end
end
