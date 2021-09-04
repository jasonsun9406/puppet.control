class role::lamp {
    include apache::apache::install
    #include profile::apache
    include profile::php
    #include profile::mysql
}