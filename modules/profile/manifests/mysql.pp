class profile::mysql {

  class { 'mysql::server':
    root_password => 'strongpass',
    remove_default_accounts => true,
    restart => true
  }
}