# instancerole is required
if $::instancerole == undef {
  fail('Missing instancerole fact.')
}

stage { 'pre': before => Stage['main'] }

class { 'baseconfig':
  stage => 'pre',
  user  => $::ssh_username
}

File {
  ensure => file,
  owner  => 'root',
  group  => 'root',
  mode   => '0644'
}

case $::instancerole {
  appserver: {
    include apache, mysql, php, appserver
  }

  default: {
    fail('Invalid instancerole fact.')
  }
}
