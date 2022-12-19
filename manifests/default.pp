node 'ansible-agent01' {

}

node 'win-9kfma7hmroh' {

}

node 'nginx01' {
  include linux_mgmt
  include role::nginx
}

node 'default' {

  notify{$facts['os']['name']:}
}