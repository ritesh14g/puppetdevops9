node 'prepare-agent' {

  package { 'nginx':
    ensure => installed,
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    content => "<h1>Provisioned by Puppet on prepare.sh - DevOps Exp 9</h1>\n",
    require => Package['nginx'],
  }

  exec { 'start-nginx':
    command => '/usr/sbin/nginx',
    unless  => '/usr/bin/pgrep -x nginx',
    require => File['/var/www/html/index.html'],
  }
}

node default { }
