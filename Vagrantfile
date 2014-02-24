Vagrant.configure("2") do |config|

    config.vm.box = "raring64"
    config.vm.box_url = "http://goo.gl/Y4aRr"

    config.vm.network :private_network, ip: "192.168.33.101"

    config.vm.synced_folder "../dev-env/", "/var/www/dev-env/",
        id: "vagrant-root",
	    owner: "vagrant",
        group: "www-data",
        mount_options: ["dmode=775,fmode=664"]

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path = "puppet/modules"
        puppet.manifest_file  = "init.pp"
        puppet.options = ['--verbose']
    end
end
