class devenv(
  $php_modules     = ['fpm', 'xdebug', 'curl', 'mysql', 'cli','mcrypt']
){
  class { 'apt':
    always_apt_update => false,
  }

  class { 'php':
    service => 'nginx'
  }

  php::module { $php_modules: }
}