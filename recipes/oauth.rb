#
# Cookbook Name:: php
# Recipe:: oauth
#

# oauth support in curl !
package 'libcurl3-dev'

php_pear_channel 'pecl.php.net' do
  action :update
end

execute 'fix pecl' do
  command 'sed -i "$ s|\-n||g" /usr/bin/pecl'
  action :run
end
execute 'install pecl-oauth' do
  command 'pecl install oauth'
  action :run
  not_if 'php -m | grep -i oauth'
end

template "#{node['php']['fpm']['mods_dir']}/oauth.ini" do
  source 'extension.ini.erb'
  owner 'root'
  group 'root'
  mode 0o644
  variables(
    name: 'oauth',
    zend: false,
    directives: []
  )
  not_if 'php -m | grep -i oauth'
end

link "#{node['php']['fpm']['ext_conf_dir']}/20-oauth.ini" do
  to "#{node['php']['fpm']['mods_dir']}/oauth.ini"
end

link "#{node['php']['conf_dir']}/conf.d/20-oauth.ini" do
  to "#{node['php']['fpm']['mods_dir']}/oauth.ini"
end
