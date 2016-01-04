# Encoding: utf-8
name 'flash'
maintainer 'Dennis Hoer'
maintainer_email 'dennis.hoer@gmail.com'
license 'MIT'
description 'Installs/Configures Adobe Flash Player'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'

supports 'windows'

depends 'windows', '~> 1.38'

source_url 'https://github.com/dhoer/chef-flash' if respond_to?(:source_url)
issues_url 'https://github.com/dhoer/chef-flash/issues' if respond_to?(:issues_url)
