# == Class: appserver
#
# Sets up directories and vhosts for app server
#
class appserver {
  appserver::var_www { ['wishlist1', 'wishlist2']: }
  appserver::vhost { ['wishlist1', 'wishlist2']: }
}
