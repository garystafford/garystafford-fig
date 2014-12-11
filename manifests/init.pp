# Class: fig
#
# This module install Fig (http://www.fig.sh)
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage: include fig
#
class fig {
  exec { 'install-fig':
    path    => ['/usr/bin/', '/usr/sbin/', '/bin'],
    command => 'curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /tmp/fig',
    user    => root,
  } ->
  exec { 'move-fig':
    path    => ['/usr/bin/', '/usr/sbin/', '/bin'],
    command => 'mv /tmp/fig /usr/local/bin',
    user    => root,
  } ->
  file { '/usr/local/bin/fig':
    path  => '/usr/local/bin/fig',
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }
}
