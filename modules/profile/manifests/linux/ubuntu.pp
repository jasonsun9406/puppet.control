class profile::linux::ubuntu {

  $domain = "toolr.local"
  $adcomputerjoinaccountname = hiera('adcomputerjoinaccountname')
  $adcomputerjoinaccountpassword = hiera('adcomputerjoinaccountpassword')
  $allowgroups = ['domain admins@toolr.local', 'sre admins@toolr.local']
  class { '::realmd':
    domain               => "$::domain",
    domain_join_user     => "$adcomputerjoinaccountname",
    domain_join_password => "$adcomputerjoinaccountpassword",
    computer_name        => upcase($::domain),
    manage_sssd_config => true,
    sssd_config        => {
      'sssd' => {
        'domains'             => "$::domain",
        'config_file_version' => '2',
        'default_domain_suffix' => "$::domain",
        'services'            => 'nss,pam',
      },
      "domain/${::domain}" => {

        'ad_domain'                      => "$::domain",
        'krb5_realm'                     => upcase($::domain),
        'realmd_tags'                    => 'manages-system joined-with-adcli',
        'cache_credentials'              => 'True',
        'id_provider'                    => 'ad',
        'access_provider'                => 'ad',
        'krb5_store_password_if_offline' => 'True',
        'default_shell'                  => '/bin/bash',
        'ldap_id_mapping'                => 'True',
        'fallback_homedir'               => '/home/%u',
        'simple_allow_groups' => $allowgroups,
        'sudo_provider' => 'ad',
        'use_fully_qualified_names' => 'True',
      },
    }
  }

  class { 'sudo':
    config_file_replace => false,
  }

  $allowgroups.each |Integer $index, String $value| {
    $stringreplacedvalue = regsubst ($value,'\s','\\\\ ')
    sudo::conf { "$index":
      priority => 10,
      content  => "%$stringreplacedvalue ALL=(ALL) NOPASSWD: ALL",
    }
  }

}