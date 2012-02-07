class webserver {
  file { '/etc/apt/sources.list.d/phpsources.list':
    source => "/vagrant/files/etc/apt/sources.list.d/phpSources.list",
    ensure => present
  }
  
  exec { 'add_nginx_key':
    command => "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C",
    path => "/usr/bin",
    require => File['/etc/apt/sources.list.d/phpsources.list']
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
    source => '/vagrant/files/etc/nginx/sites-enabled/default',
  }
  
  service { nginx:
    ensure => running,
    subscribe => File['/etc/nginx/sites-enabled/default'],
  }
  
}