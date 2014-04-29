# == Define: vhost
#
# Sets up an Apache virtual host
#
define appserver::vhost() {
  file {
    "/etc/apache2/sites-available/${name}.conf":
      ensure  => present,
      content => template('appserver/vhost.erb'),
      require => [ Package['apache2'], File["/var/www/${name}"] ],
      notify  => Service['apache2'];

    "/etc/apache2/sites-enabled/${name}.conf":
      ensure  => link,
      target  => "/etc/apache2/sites-available/${name}.conf",
      require => Package['apache2'],
      notify  => Service['apache2'];
  }
}
