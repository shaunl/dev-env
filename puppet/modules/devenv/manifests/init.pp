class devenv(){
  class { 'apt':
    always_apt_update => false,
  }
}