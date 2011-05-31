node 'vagrant-lucid64.vagrantup.com' inherits default {
}

node 'django-server' inherits default {
  include django-stack
}
