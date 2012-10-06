class jitney {
    exec { 'bundle exec rails server':
      cwd     => '/home/vagrant/Jitney',
      path    => ['/usr/bin', '/usr/sbin'],
      require => Exec['test'],
    }

    exec { 'test':
      command => 'bundle exec rake',
      cwd     => '/home/vagrant/Jitney',
      path    => ['/usr/bin', '/usr/sbin'],
      require => Exec['install_dependencies'],
    }

    exec { 'install_dependencies':
        command => 'bundle install  --path .bundle',
        cwd     => '/home/vagrant/Jitney',
        path    => ['/usr/bin', '/usr/sbin'],
        require => [File['jitney-project-directory'], Class['ruby']],
    }

    file { 'jitney-project-directory':
        ensure => 'directory',
        path   => '/home/vagrant/Jitney',
    }
}