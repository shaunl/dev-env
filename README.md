dev-env
=======

Vagrant - Puppet provisioning development environment

In development!

Currently provisioning:
 - Ubuntu Raring Ringtail (64Bit)
 - Nginx with vhost entry for www.devenv.com
 - PHP with packages: FPM, Xdebug, Curl, MySql, Cli, MCrypt
 - Git

###Installation###

Before using this you must have Vagrant and Virtualbox running!!

 - `git clone --recursive ` this repo
 - `cd dev-env`
 - `vagrant up`

####Known Issues####

 - On first provisioning Nginx sometimes won't start as port 80 is blocked, `vagrant halt` then `vagrant up` for fix