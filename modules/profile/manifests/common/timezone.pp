class profile::timezone {
  class { 'timezone':
    timezone => 'America/Vancouver',
  }
}