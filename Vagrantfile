Vagrant::Config.run do |config|
    # All Vagrant configuration is done here. The most common configuration
    # options are documented and commented below. For a complete reference,
    # please see the online documentation at vagrantup.com.

    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.define :fw do |fw_config|
        fw_config.vm.box = "lucid32"
        fw_config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
        fw_config.vm.forward_port "http", 80, 9080
        fw_config.vm.customize do |vm|
          vm.memory_size = 384 
          vm.cpu_count = 1
        end
        fw_config.vm.network("192.168.0.10")
        fw_config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "manifests"
            puppet.module_path = "modules"
            puppet.manifest_file = "site.pp"
        end
        #fw_config.vm.share_folder("dropbox", "/home/<something>", "/Users/<something>", :nfs => true)

        #fw_config.vm.boot_mode = :gui
    end
end
