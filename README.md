# kodi

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
4. [Limitations - OS compatibility, etc.](#limitations)

## Overview

The kodi module lets you use Puppet to setup the needed ppas and install kodi.

## Usage

### Beginning with kodi

To use the kodi module with default parameters, declare the `kodi` class.

```puppet
include kodi
```

### Setup the unstable ppa

```puppet
class { 'kodi':
  unstable => true,
}
```

### Setup the nightly ppa

```puppet
class { 'kodi':
  nightly => true,
}
```

### Setup a custom ppa

```puppet
class { 'kodi':
  ppa => 'ppa:team-xbmc/kodi-old',
}
```

## Reference

### Classes

#### Public Classes

* [`kodi`](#class-kodi)

#### Private Classes

* `kodi::install`: Handles ppa setup and kodi installation.

#### Class: `kodi`

Main class, includes all other classes.

##### Parameters (all optional)

* `nightly`: Specifies whether the nightly ppa should be configured. Valid options: 'true' and 'false'. Default: 'false'.
* `package_ensure`: Passed to the kodi::install package resource ensure parameter.
* `package_name`: Names the package that provides kodi. Valid options: a string. Default: 'kodi'.
* `ppa`: Specifies an alternate ppa to setup. Valid options: a string or an array. Default: undef.
* `unstable`: Specifies whether the unstable ppa should be configured. Valid options: 'true' and 'false'. Default: 'false'.

## Limitations

This module is tested on Ubuntu 12.04 and 14.04.
