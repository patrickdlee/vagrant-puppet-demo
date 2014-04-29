# instancerole fact is required
if $::instancerole == undef {
  fail('Missing instancerole fact.')
}

# add new run stage that precedes main stage
stage { 'pre': before => Stage['main'] }

# make sure baseconfig is applied first
class { 'baseconfig':
  stage => 'pre',
  user  => $::ssh_username
}

# set defaults for File resources
File {
  ensure => file,
  owner  => 'root',
  group  => 'root',
  mode   => '0644'
}

# determine role from instancerole fact
case $::instancerole {
  appserver: {
    include apache, mysql, php, appserver
  }

  default: {
    fail('Invalid instancerole fact.')
  }
}
