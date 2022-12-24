class role::linux {
    include profile::common::timezone
    include profile::common::dns
    include profile::linux::ubuntu

}