# == Class: mesosdns::install
#
# Authors
# -------
#
# Richard Hillmann <rhillmann@intelliad.de>
#
# Copyright
# ---------
#
# Copyright 2016 intellAd Media GmbH.
#
# Description
# -----------
#
# Manage mesosdns installation of the binary
#
class mesosdns::install (
  $ensure,
  $version,
  $source,
  $path,
) {
  # inject version to template
  $_source = inline_template($source)

  # create temp file to trigger new download
  #$version_hash = md5($_source)
  $version_path = "${path}/version/"
  $version_file = "${version_path}mesos-dns-${version}"

  $path_binary =  "${path}/mesos-dns"

  if $ensure == 'present' {
    file { $path:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
    ->
    file { $version_path:
      ensure  => directory,
      purge   => true,
      recurse => true,
      force   => true,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      before  => Exec[$version_file],
    }

    if ! defined(Package['wget']) {
      package { 'wget': ensure => installed }
    }

    exec { $version_file:
      command => "wget --no-check-certificate --output-document=${version_file} $_source",
      creates => $version_file,
      require => Package['wget'],
    }

    # download file via archive
    #archive { $version_file:
    #  source  => $_source,
    #  extract => false,
    #  cleanup => false,
    #}

    file { $path_binary:
      ensure  => link,
      target  => $version_file,
      require => Exec[$version_file],
      notify  => Service['mesos-dns'],
    }
    ->
    file { $version_file:
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      require => Exec[$version_file],
      notify  => Service['mesos-dns'],
    }
  } else {
    file { $path:
      ensure  => absent,
      purge   => true,
      recurse => true,
      force   => true,
    }
  }
}
