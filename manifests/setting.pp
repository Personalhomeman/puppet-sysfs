define sysfs::setting($value) {
  include sysfs

  concat::fragment { $name:
    target  => '/etc/sysfs.conf',
    content => "${name}=${value}\n",
    notify  => Exec["Set /sys/${name} to ${value}"],
  }

  exec { "Set /sys/${name} to ${value}":
    command     => "/bin/echo '${value}' > /sys/${name}",
    refreshonly => true,
  }
}
