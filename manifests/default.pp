node 'jenkins-master01' {

}
node 'ansible-agent01' {

}

node 'win-9kfma7hmroh' {

}


node 'nginx01' {
  include linux_mgmt
  include role::nginx
}

node 'default' {

  $os = $facts['os']['name']
  $test = hiera('jasonstring')

  if ($os == 'ubuntu'){
    notify {"I am testing: $test":}
  }
}