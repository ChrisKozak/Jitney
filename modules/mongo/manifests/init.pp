class mongo {
    service { 'mongodb':
        ensure    => 'running',
        enable    => true,
        require   => Package['mongodb-10gen'],
    }

    package { ["mongodb-10gen"]:
      ensure => present,
    }

    exec { "apt-get update":
        command => "/usr/bin/apt-get update",
        onlyif => "/bin/sh -c '[ ! -f /var/cache/apt/pkgcache.bin ] || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin | /bin/grep . > /dev/null'",
        require => [File["10gen.list"]],
    }

    file { "10gen.list":
        path    => "/etc/apt/sources.list.d/10gen.list",
        ensure  => present,
        owner   => "root",
        group   => "root",
        mode    => 0644,
        replace => false,
        content => "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen",
        require => Exec["mongo_repokey"],
    }

    exec { "mongo_repokey":
        command => "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10",
        path    => "/usr/local/bin/:/bin/:/usr/bin/",
    }
}