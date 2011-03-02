# templates.pp
# All server templates for various flavors of templates defined here

class baseclass {
    include $operatingsystem,
    ntp,
    autofs
#    snmp
#        cron,
#        dns,
#        puppetclient,
#        ssh,
#        unixadmin_users,
#        user_root,
#        virt_all_users
#    package { "ourcompany-package": ensure => present }
#
    file {
        # our hierarchical namespace as registered with LANANA
        "/opt/$lsbProvider":
            mode   => 755,
            ensure => directory;
        # directory structure that we use everywhere
        "/data":
            mode   => 755,
            ensure => directory;
    } # file

    #$mounts = [ "home" ]

    #autofs::auto_master { "master": mounts => $mounts }

    #autofs::auto_mount { "home":
	 #   mount_data => [ "*#-fstype=nfs,vers=3,rsize=32768,wsize=32768,tcp,rw,nosuid,nodev,hard,intr#aws-nas-00:/export/lv0/home/&" ]
    #}
}

node default {
    include baseclass
}
