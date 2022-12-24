class profile::common::dns {
  class { 'resolv_conf':
    nameservers => ['192.168.1.210','192.168.1.254'],
    searchpath  => ['toolr.local'],
  }
}