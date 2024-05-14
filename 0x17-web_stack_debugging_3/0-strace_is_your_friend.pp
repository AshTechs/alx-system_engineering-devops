# 0-strace_is_your_friend.pp

exec { 'fix-apache-error':
  command     => '/bin/sed -i "s/SomeString/SomeOtherString/" /path/to/apache/config/file',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
  subscribe   => File['/path/to/apache/config/file'],
}
