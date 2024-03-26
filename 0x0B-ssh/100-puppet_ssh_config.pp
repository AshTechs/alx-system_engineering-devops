#!/usr/bin/env bash
# Using pugget to connect without a password

file { '/etc/ssh/ssh_config':
	ensure => present,
}

file_line { 'Turn off password auth':
	path => '/etc/ssh/ssh_config',
	line => 'Passwordauthentication no',
	match => '^#PasswordAuthentication',
}
file_line { 'Declare identity file':
        path => '/etc/ssh/ssh_config',
        line => 'IdentityFile ~/.ssh/school',
        match => '^#IdentityFile',
}
