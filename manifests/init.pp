# Class kodi
class kodi (
  $nightly            = false,
  $package_ensure     = 'present',
  $package_name       = 'kodi',
  $ppa                = 'ppa:team-xbmc/ppa',
  $unstable           = false,
) {

  if ($::operatingsystem != 'Ubuntu') {
    fail("${::operatingsystem} not supported")
  }

  validate_bool($nightly)
  validate_string($package_name)

  if !(is_array($ppa) or is_string($ppa)) {
    fail('$ppa must be a string or array.')
  }

  validate_bool($unstable)

  $_nightly = $nightly ? {
    true    => 'ppa:team-xbmc/xbmc-nightly',
    default => undef,
  }

  $_unstable = $unstable ? {
    true    => 'ppa:team-xbmc/unstable',
    default => undef,
  }

  $_ppa = delete_undef_values([
    $ppa,
    $_unstable,
    $_nightly,
  ])

  class { '::kodi::install': } ->
  Class['::kodi']

}
