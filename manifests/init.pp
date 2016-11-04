class sysfs {
  package { 'sysfsutils':
    ensure => installed,
  }

  concat { '/etc/sysfs.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['sysfsutils'],
  } ~>
  service { 'sysfsutils':
    hasstatus  => false,
    hasrestart => true,
    enable     => true,
  }
}
