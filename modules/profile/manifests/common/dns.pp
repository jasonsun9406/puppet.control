class profile::common::dns {
  class { 'resolv_conf':
    nameservers => ['192.168.1.210'],
    searchpath  => ['toolr.local'],
  }
}