class role::linux::ubuntu20-04 {
    include profile::common::timezone
    include profile::common::dns

    include profile::linux::ubuntu

}