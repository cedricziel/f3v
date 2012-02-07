class common {
  group { 'puppet':
    ensure => present
  }
  
  group {'app':
    ensure => present
  }
  
  user_homedir { "app":
    group => "app",
    fullname => "The App User",
    ingroups => ['app']
  }
  
  user { 'www-data':
    groups => 'app',
    require => User['app']
  }
  
  define user_homedir ($group, $fullname, $ingroups) {
      user { "$name":
        ensure => present,
        comment => "$fullname",
        gid => "$group",
        groups => $ingroups,
        membership => minimum,
        shell => "/bin/bash",
        home => "/home/$name",
        require => Group[$group],
      }
    
      exec { "$name homedir":
        command => "/bin/cp -R /etc/skel /home/$name; /bin/chown -R $name:$group /home/$name",
        creates => "/home/$name",
        require => User[$name],
      }
    }
}

  