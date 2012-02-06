class webserver {
  file { 'add_phpfpm':
    source => "/vagrant/Vagrant/files/etc/apt/sources.list.d/phpSources.list",
    path => "/etc/apt/sources.list.d/phpsources.list",
    ensure => present
  }
  
  exec { 'add_nginx_key':
    command => "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C",
    path => "/usr/bin",
    require => File['add_phpfpm']
  }
  
  exec { 'update_sources':
    command => "sudo apt-get update",
    path => "/usr/bin",
    require => Exec['add_nginx_key']
  }
  
  package { 'nginx':
    ensure => present,
    require => Exec['update_sources'],
  }
  
  file { '/etc/nginx/sites-enabled/default':
    ensure => present,
    source => '/vagrant/Vagrant/files/etc/nginx/sites-enabled/default',
  }
  
  service { nginx:
    ensure => running,
    subscribe => File['/etc/nginx/sites-enabled/default'],
  }
  
}