# site.pp
import "modules"
import "templates"
import "nodes"
import "classes/*"

#
# based on the puppet docs and 
# https://github.com/ghoneycutt/puppet-sitemanifest/blob/master/site.pp
#
# set platform global variable
$platform = "$operatingsystem-$lsbdistcodename-$architecture"
#
# LSB Provider Name - http://www.lanana.org/lsbreg/providers/providers.txt
$lsbProvider = "github"

# default snmp sysLocation
$snmpSyslocation = "unknown"

# this is used to specify the primary puppet server, which is used
# # by get_branch in puppet::server and must be used to bootstrap
# # new environments
# $primary_puppet_server = "puppet.somepop.yourdomain.com"

# Default file parameters
File {
    ignore => [ '.svn', '.git', 'CVS' ],
    owner  => "root",
    group  => "root",
    mode   => "644",
}

# default exec parameters
Exec {
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
}

# by default when we talk about a package we want to install it.
Package {
    ensure => installed,
}

# used in class puppet and referenced elsewhere
$semaphoreDir = "/var/lib/puppet/semaphores"

# public ntp servers
#
$ntpServerList = [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ]

# nameservers - used in every client's resolv.conf
# auth_nameservers - used in caching nameservers' forwarders only
#
#                      ns1.sea0
$auth_nameservers = [ '8.8.4.4' ]

# if we use a dns architecture that employs [a|i]xfr with master/slaves we can enable
# this here and in the bind templates
$named_slave_ips = [ 'not used' ]

# caching nameservers
#                       dns1.sea0
$cache_nameservers = [ '8.8.8.8' ]
$dnssearchpath    = ".local"
$nameservers = [ '8.8.8.8', '8.8.4.4' ]

# pop specific variables
#
# possible values for $envSilo are 'dev', 'qa', 'stg', or 'prod'
#
# update modules/generic/lib/puppet/parser/functions/pop.rb when adding new pop's
#
case $pop {
    aws-us-east1: {
        $ntpServerList    = [ '0.us.pool.ntp.org', '1.us.pool.ntp.org', '2.us.pool.ntp.org' ]
        #                     linode         speakeasy     speakeasy
        $nameservers      = [ '64.62.x.x', '66.93.87.2', '216.231.41.2' ]
        $dnssearchpath    = "${pop}.yourdomain.com ${pop}.yourdomain.priv yourdomain.com"
        $softwarerepo     = "softwarerepo.dfw1.yourdomain.priv"
        $logServerList    = [ '127.0.0.1' ]
        $envSilo          = 'prod'
    } # dwf1

} # case $pop

# set appropriate email contact baed on $envSilo
$contactEmail = $envSilo ? {
    default => "nobody@nowhere.com",
    prod    => "nobody@nowhere.com",
} # $contactEmail


filebucket { main: server => puppet }

# global defaults
File { backup => main }


Package {
    provider => $operatingsystem ? {
        ubuntu => aptitude,
        debian => aptitude,
        redhat => up2date,
        CentOS => yum,
    }
}
