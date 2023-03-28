# Install a package using Puppet

exec { 'install flask':
  command => '/usr/bin/apt-get install -y flask'
}

exec { 'install pip3':
  command => '/usr/bin/gem install pip3 -v 2.1.0'
}

package { 'flask':
  ensure => 'installed',
  before => Exec['install flask']
}

package { 'pip3':
  ensure  => 'installed',
  before  => Exec['install pip3'],
  require => Package['flask']
}
