define sysfs::setting($value) {

    include sysfs

    concat::fragment {
        "${name}":
            target => "/etc/sysfs.conf",
            content => "${name}=${value}\n";
    }

    exec { "Set /sys/${name} to ${value}":
      command => "/bin/echo '${value}' > /sys/${name}",
      unless  => "/bin/grep '\[${value}\]' /sys/${name}",
    }
}
