# This Puppet manifest is for fixing Apache 500 error issue

# Ensure Apache service is running
service { 'apache2':
  ensure => 'running',
}

# Ensure Apache error log file exists and has correct permissions
file { '/var/log/apache2/error.log':
  ensure => 'file',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
}

# Ensure Apache error log file has proper SELinux context
selboolean { 'httpd_can_network_connect_db':
  value => 'on',
}

# Ensure Apache error log file has proper permissions
selmodule { 'httpd_can_network_connect':
  ensure => 'present',
}

# Ensure Apache error log file has proper ownership
seltype { 'httpd_t':
  ensure => 'present',
}
