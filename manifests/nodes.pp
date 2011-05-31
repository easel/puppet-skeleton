node 'vagrant-lucid64.vagrantup.com' inherits default {
}

node 'ip-10-245-218-240' inherits default {
  include django-stack
  include jenkins
  django-stack::app {"wiser_stg":
  }
  
}
