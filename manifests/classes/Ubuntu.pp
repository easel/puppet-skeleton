# manifests/classes/Ubuntu.pp

class ubuntu {
	include apt
	apt::sources_list {"lucid-partner":
	  ensure  => present,
	  content => "deb http://archive.canonical.com/ lucid partner",
	}
	apt::sources_list {"lucid-multiverse":
	  ensure  => present,
	  content => "deb http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid main multiverse",
	}
	apt::sources_list {"lucid-updates-multiverse":
	  ensure  => present,
	  content => "deb http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid-updates main multiverse",
	}
	apt::key {"8683D8A2":
	  source  => "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x99B656EA8683D8A2",
	}
	apt::sources_list {"lucid-postgresql9":
	  ensure  => present,
	  content => "deb http://ppa.launchpad.net/pitti/postgresql/ubuntu lucid main",
	}
	#apt::sources_list {"lucid-librato":
	#  ensure  => present,
	#  content => "deb http://apt.librato.com/ubuntu/ lucid non-free",
	#}
	apt::key {"8F101159":
	  source  => "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x788D1B418F101159",
	}
	apt::sources_list {"lucid-easel":
	  ensure  => present,
	  content => "deb http://ppa.launchpad.net/erik-labianca/erik-labianca-ppa/ubuntu lucid main",
	}

}



