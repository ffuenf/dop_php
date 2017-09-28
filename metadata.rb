maintainer 'Achim Rosenhagen'
maintainer_email 'a.rosenhagen@ffuenf.de'
license 'Apache-2.0'
description 'installs/configures dop_php'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url 'https://github.com/ffuenf/dop_php/issues'
source_url 'https://github.com/ffuenf/dop_php'
name 'php'
chef_version '>= 12.5' if respond_to?(:chef_version)
version '4.1.1'

%w(debian ubuntu).each do |os|
  supports os
end

%w(
  apt
  git
  build-essential
  dotdeb
  composer
  redisio
).each do |ressource|
  depends ressource
end
