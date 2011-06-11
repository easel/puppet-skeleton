node 'vagrant' inherits default {
    include django-stack
    django-stack::app {"test_app":
       vhost_name => "000-default",
       server_name => "stg.vagrantup.local",
       server_aliases => "*.stg.vagrantup.local", 
    }
}

# vim modeline - have 'set modeline' and 'syntax on' in your ~/.vimrc.
# vi:syntax=puppet:filetype=puppet:ts=8:sw=4:et:
