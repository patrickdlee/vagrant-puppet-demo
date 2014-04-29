# == Class: apache
#
# Installs packages for Apache2, enables modules, and sets config files.
#
class apache {
  package { 'apache2':             ensure => present }
  package { 'apache2-mpm-prefork': ensure => present }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2'];
  }

  #apache::conf { ['apache2.conf', 'envvars', 'ports.conf']: }
  apache::module { ['rewrite.load']: }

  file { '/etc/apache2/sites-enabled/000-default.conf':
    ensure => absent,
    notify => Service['apache2'];
  }
}
