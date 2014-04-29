# == Define: var_www
#
# Sets up folders and symlinks in /var/www
#
define appserver::var_www() {
  file {
    "/var/www/${name}":
      ensure  => symlink,
      target  => "/home/vagrant/code/appserver/${name}",
      require => Package['apache2'];
  }
}
