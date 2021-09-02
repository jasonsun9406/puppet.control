class profile::apache {
  class { 'apache':
    ensure => 'absent'
  }

  apache::listen {'88':}
}
