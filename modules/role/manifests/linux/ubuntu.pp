class role::linux::ubuntu {
    include profile::common::timezone
    include profile::common::dns

    include profile::linux::ubuntu

}