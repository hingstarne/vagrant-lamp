file { '/etc/apt/sources.list.d': ensure => directory;}->
apt::ppa { 'ppa:ondrej/php5-oldstable': }->
class{'php':}->
class { ['php::fpm', 'php::cli', 'php::extension::apc']:

}
