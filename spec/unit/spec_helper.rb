# Encoding: utf-8
require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/cacher'

ChefSpec::Coverage.start!

::LOG_LEVEL = :warn
::CENTOS_OPTS = {
  platform: 'centos',
  version: '6.6',
  log_level: ::LOG_LEVEL
}
::UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '14.04',
  log_level: ::LOG_LEVEL
}
::WINDOWS_OPTS = {
  platform: 'windows',
  version: '2012R2',
  log_level: ::LOG_LEVEL
}
::CHEFSPEC_OPTS = {
  log_level: ::LOG_LEVEL
}
