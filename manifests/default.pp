node 'ansible-agent01' {

}

node 'win-9kfma7hmroh' {
  exec { 'stop-newrelicservice':
    command   => 'Stop-Service newrelic-infra -Force -PassThru',
    unless    => '$service = Get-Service -Name newrelic-infra -ErrorAction SilentlyContinue;
                  if ($service -eq $null) {Exit1}',
    provider  => powershell,
    logoutput => true,
  }
}
