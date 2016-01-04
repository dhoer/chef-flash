# Encoding: utf-8
require 'chefspec'
require 'chefspec/berkshelf'
require_relative '../../libraries/default'

ChefSpec::Coverage.start!

::LOG_LEVEL = :warn
::WINDOWS_OPTS = {
  platform: 'windows',
  version: '2012R2',
  log_level: ::LOG_LEVEL
}
::CHEFSPEC_OPTS = {
  log_level: ::LOG_LEVEL
}
