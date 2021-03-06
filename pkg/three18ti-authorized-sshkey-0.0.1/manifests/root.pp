class autorized-sshkey::root(
    $authorized_keys    = {},
    $key_dir            = '/root/.ssh',
    $key_file           = '/root/.ssh/authorized-keys',
) {
    file { $key_dir:
        ensure => "directory",
        owner  => "root",
        group  => "root",
    }

    file { $key_file:
        content => template ('authorized-sshkey/authorized-keys.erb'),
        require => [ File[$key_dir], ],
    }
}
