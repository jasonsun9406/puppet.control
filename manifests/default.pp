node 'jenkins-master01' {

}
node 'ansible-agent01' {

}

node 'win-miha0ugrs92' {
  pspackageprovider {'Nuget':
    ensure   => 'present'
  }
  package { 'Az':
    ensure => '11.2.0',
    source => 'PSGallery',
    provider => 'windowspowershell',
    install_options  => ['-AllowClobber']
  }
}


node 'nginx01' {
  # include linux_mgmt
  include role::nginx
}

node 'default' {

  $os = $facts['os']['name']

  if ($os == 'ubuntu'){
    include role::linux::ubuntu
  }
}
