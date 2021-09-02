class profile::php {
  class { '::php':
    ensure       => absent,
    manage_repos => true,
    fpm          => true,
    dev          => true,
    composer     => true,
    pear         => true,
    phpunit      => false,
  }

}