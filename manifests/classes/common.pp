class common {
  group { 'puppet':
    ensure => present
  }
  
  user { 'vagrant':
    groups => 'www-data'
  }
}