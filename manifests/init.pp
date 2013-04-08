# == Class: composer
#
# Installs PHP composer globally.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
#  class { composer: }
#
# === Authors
#
# Author Name: orlissenberg
#
# === Apache License, Version 2.0
#

class composer {
    package { "php":
        ensure => present
        } ->

    exec { "curl-composer":
        command => "curl -sS https://getcomposer.org/installer | php",
        cwd     => "/tmp",
        path    => ["/usr/bin", "/usr/sbin"],
        user    => "root",
        } ->

    exec { "install-globally":
        command => "sudo mv composer.phar /usr/local/bin/composer",
        cwd     => "/tmp",
        path    => ["/usr/bin", "/usr/sbin"],
        user    => "root",
        }
}

