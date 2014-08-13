file { '/etc/apt/sources.list.d': ensure => directory;}->
apt::ppa { 'ppa:ondrej/php5-oldstable': }->
class{'php':}->
class { ['php::fpm', 'php::cli', 'php::extension::apc']:}->
package{'php5-mysql':}->
class {'mysql::server':}
class {'mongodb::server':
      noprealloc => true;
      }