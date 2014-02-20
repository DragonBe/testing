class setup {
  exec { "apt-get update":
    command => "/usr/bin/apt-get update"
  }

  package { "apache2":
    ensure => present,
    require  => Exec['apt-get update'],
  }

  file { "default-apache2":
    path    => "/etc/apache2/sites-available/default",
    ensure  => file,
    require => Package["apache2"],
    source  => "/vagrant/config/apache/vagrant",
    notify  => Service["apache2"]
  }

  file { "enabled-apache2":
    path    => "/etc/apache2/sites-enabled/default",
    ensure  => link,
    target  => "/etc/apache2/sites-available/default",
    notify  => Service["apache2"]
  }

  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }

  package { "php5":
    ensure => present,
    require  => Exec['apt-get update'],
  }

  package { "php5-dev":
    ensure => present,
  }

  package { "php5-cli":
    ensure => present,
  }

  package { "php5-common":
    ensure => present,
  }

  package { "php5-mysql":
    ensure => present,
  }

  package { "php5-curl":
    ensure => present,
  }

  package { "php-apc":
    ensure => present,
  }

  file { "/etc/php5/conf.d/timezone.ini":
    replace => false,
    ensure => present,
    source => "/vagrant/config/php/timezone.ini",
    notify => Service["apache2"]
  }

  package { "mysql-server":
    ensure => present,
    require  => Exec['apt-get update'],
  }

  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  package { "sqlite3":
    ensure => present,
    require  => Exec['apt-get update'],
  }

  exec { "set-mysql-password":
    unless  => "mysql -uroot -proot",
    path    => ["/bin", "/usr/bin"],
    command => "mysqladmin -uroot password root",
    require => Service["mysql"],
  }

  exec { "create-database":
    unless  => "/usr/bin/mysql -uin2it_test -pin2it_test in2it_test",
    command => "/usr/bin/mysql -uroot -proot < /vagrant/data/in2it_test.sql",
    require => Exec["set-mysql-password"],
    logoutput => true,
    timeout => 0
  }

  package { "curl":
    ensure => present,
  }

  package { "git-core":
    ensure => present,
  }

  package { "subversion":
    ensure => present,
  }

  group { "puppet":
      ensure => present,
  }
}

include setup