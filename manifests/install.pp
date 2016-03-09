# Class kodi::install
class kodi::install {

  include ::apt

  apt::ppa { $::kodi::_ppa:
    package_manage => true,
  }

  package { $::kodi::package_name:
    ensure  => $::kodi::package_ensure,
    require => [
      Class['apt::update'],
      Apt::Ppa[$::kodi::_ppa],
    ],
  }
}
