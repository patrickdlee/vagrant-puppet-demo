# == Class: php
#
# Installs PHP5 and necessary modules.
#
class php {
  package { 'php5':                ensure => present }
  package { 'php5-cli':            ensure => present }
  package { 'php5-curl':           ensure => present }
  package { 'php5-dev':            ensure => present }
  package { 'php5-mysql':          ensure => present }
  package { 'php5-xmlrpc':         ensure => present }
  package { 'libapache2-mod-php5': ensure => present }
}
