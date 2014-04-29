# == Class: baseconfig
#
# Performs needed configuration tasks for every virtual machine.
#
class baseconfig($user = 'vagrant') {
  package { 'build-essential': ensure => present }
  package { 'htop':            ensure => present }
  package { 'tree':            ensure => present }
  package { 'unzip':           ensure => present }

  file { "/home/${user}/.bashrc":
    ensure  => present,
    source  => 'puppet:///modules/baseconfig/bashrc',
    owner   => $user,
    group   => $user;
  }

  package { 'tzdata': ensure => present }

  file { '/etc/localtime':
    ensure  => symlink,
    target  => '/usr/share/zoneinfo/America/Boise',
    require => Package['tzdata']
  }
}
