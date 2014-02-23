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
    www_root => '/var/www/dev-env',
  }

  php::module { $php_modules: }
}
