class profile::timezone {
  class { 'resolv_conf':
    nameservers => ['192.168.1.254', '192.168.1.210'],
    searchpath  => ['toolr.local'],
  }
}