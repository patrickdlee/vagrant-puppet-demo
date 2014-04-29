# == Class: mysql
#
# Installs MySQL server and sets root password.
#
class mysql {
  package { 'mysql-server': ensure => present }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'];
  }

  # NOTE: I do NOT recommend using Puppet to set your MySQL root password. This
  #   is just to demonstrate an 'exec' resource and get up and running faster.
  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot status',
    command => 'mysqladmin -uroot password root',
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }
}
