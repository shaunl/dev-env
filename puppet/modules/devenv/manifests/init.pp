class devenv(
$php_modules     = ['fpm', 'xdebug', 'curl', 'mysql', 'cli','mcrypt']
){
  class { 'apt':
    always_apt_update => false,
  }

  class { 'php':
    service => 'nginx'
  }

  class { 'nginx': }

  nginx::resource::vhost { 'www.devenv.com':
    ensure      => 'present',
    www_root    => '/var/www/dev-env',
    ipv6_enable =>  true,
    index_files => ['index.php', 'index.html', 'index.htm'],
    listen_port => '8080'
  }

  nginx::resource::location { '/':
    ensure          => present,
    vhost           => 'www.devenv.com',
    www_root        => '/var/www/dev-env',
    location        => '~ \.php$',
    proxy           => undef,
    fastcgi         => 'unix:/var/run/php5-fpm.sock',
    fastcgi_script  => undef,
    location_cfg_append => {
      fastcgi_connect_timeout => '3m',
      fastcgi_read_timeout    => '3m',
      fastcgi_send_timeout    => '3m',
      fastcgi_index           => 'index.php'
    },
    fastcgi_params  => '/etc/nginx/fastcgi_params'
  }

  php::module { $php_modules: }

  class { '::mysql::server':
    root_password    => 'vagrant',
    override_options => { 'mysqld' => { 'max_connections' => '1024' } }
  }

    class { 'redis':
    version => '2.6.5',
  }

  class {'varnish':
    varnish_listen_port => 80,
    varnish_storage_size => '32M',
  }

  class {'git': }

  class { 'composer':
    require => [
      Class[ 'php' ]
    ]
  }
}
