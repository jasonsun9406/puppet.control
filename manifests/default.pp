node 'ansible-agent01' {

}

node 'win-9kfma7hmroh' {

  exec { 'Check-Service':
    command   => '',
    onlyif    => 'if (!(Get-Service -Name puppet -ErrorAction SilentlyContinue)){exit 1}',
    provider  => powershell,
    logoutput => true,
    notify    => Dsc['stop-newrelicservice']
  }

  dsc {'stop-newrelicservice':
    resource_name => 'Service',
    module => 'PSDesiredStateConfiguration',
    properties => {
      name          => 'newrelic-infra',
      ensure          => 'present',
      startupType   => 'Disabled',
      state         => 'Stopped',
    },
    subscribe   => Exec['Check-Service']

  }
}
