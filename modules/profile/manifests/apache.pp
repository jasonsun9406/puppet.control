class profile::apache {
  class { 'apache': }

  apache::listen {'88':}
}
