#
# Cookbook Name:: php
# Recipe:: _package
#

include_recipe 'apt'
include_recipe 'dotdeb' if node['platform'] == 'debian'

apt_repo_uri = (node['php']['version'] == '5.6' || node['php']['version'] == '7.0') ? 'http://ppa.launchpad.net/ondrej/php/ubuntu' : 'http://ppa.launchpad.net/ondrej/php5/ubuntu'

apt_repository 'php' do
  uri apt_repo_uri
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key 'E5267A6C'
  only_if { platform?('ubuntu') }
end

node['php']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

template "#{node['php']['conf_dir']}/php.ini" do
  source 'php.ini.erb'
  owner 'root'
  group 'root'
  mode 0o644
  variables(php: node['php']['php_ini'])
end

directory node['php']['session_dir'] do
  owner 'root'
  group 'root'
  mode 0o1733
  recursive true
  action :create
  only_if { node['php']['save_handler'] == 'file' }
end

directory node['php']['upload_dir'] do
  owner 'root'
  group 'root'
  mode 0o1777
  recursive true
  action :create
end

template '/etc/cron.d/php' do
  source 'php.cron.erb'
  owner 'root'
  group 'root'
  variables(
    maxlifetime_script: '/usr/lib/php/maxlifetime'
  )
  mode 0o644
end

if node['php']['tmpfs']
  total_mem = (node['memory']['total'].to_i / 1024) + (node['memory']['swap']['total'].to_i / 1024)
  if total_mem < node['php']['tmpfs_size'].to_i
    Chef::Log.info('You have specified a much bigger tmpfs session store than you can handle. Add more memory or swap or adjust the tmpfs size!')
  else
    mount node['php']['session_dir'] do
      device 'tmpfs'
      fstype 'tmpfs'
      options ["size=#{node['php']['tmpfs_size']}", 'mode=1733', 'noatime', 'noexec', 'nosuid', 'nodev']
      dump 0
      pass 0
      action [:enable, :mount]
      supports [remount: true]
      only_if { node['php']['save_handler'] == 'file' }
    end
    mount node['php']['upload_dir'] do
      device 'tmpfs'
      fstype 'tmpfs'
      options ["size=#{node['php']['tmpfs_size']}", 'mode=1733', 'noatime', 'noexec', 'nosuid', 'nodev']
      dump 0
      pass 0
      action [:enable, :mount]
      supports [remount: true]
    end
  end
end
