class profile::common::timezone {
  class { 'timezone':
    timezone => 'America/Vancouver',
  }
}