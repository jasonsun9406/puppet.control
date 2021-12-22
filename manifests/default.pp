node 'ansible-agent01' {

}

node 'win-9kfma7hmroh' {

  exec { 'Check-Service':
    command   => '',
    onlyif    => 'if (!(Get-Service -Name newrelic-infra -ErrorAction SilentlyContinue)){exit 1}',
    provider  => powershell,
    logoutput => true,
    before    => DSC['stop-newrelicservice']
  }

  dsc {'stop-newrelicservice':
    resource_name => 'Service',
    module => 'PSDesiredStateConfiguration',
    properties => {
      name          => 'newrelic-infra',
      ensure          => 'present',
      startupType   => 'Disabled',
      state         => 'Stopped',
    }
  }
}
