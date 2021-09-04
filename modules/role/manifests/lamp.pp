class role::lamp {
    include customapache::install
    #include profile::apache
    include profile::php
    #include profile::mysql
}