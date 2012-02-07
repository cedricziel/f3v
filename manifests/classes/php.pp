class php {
  $phpBasePackages = ["php5-fpm", "php5-cli", 'php5-dev', 'php-pear']
  Package { ensure => "installed" }
  # make sure, that php is installed
  package {$phpBasePackages: }
  
  # configure the needed fcgi pool
  file {'/etc/php5/fpm/pool.d/default.conf':
    source => '/vagrant/files/etc/php/fpm/pool.d/default.conf',
    require => Package[$phpBasePackages],
  }
  
  # make the service dependant...
  service {'php5-fpm':
    subscribe => File['/etc/php5/fpm/pool.d/default.conf']
  }
}