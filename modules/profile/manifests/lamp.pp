class profile::lamp::default {
    include apache
    include mysql::server
    include php
}