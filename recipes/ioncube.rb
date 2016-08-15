#
# Cookbook Name:: php
# Recipe:: ioncube
#
src_filename = node['php']['ioncube']['filename']
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{Chef::Config['file_cache_path']}/ioncube/#{node['php']['ioncube']['checksum']}"

directory node['php']['ioncube']['home'] do
  recursive true
end

remote_file src_filepath do
  source node['php']['ioncube']['download_url']
  checksum node['php']['ioncube']['checksum']
  owner 'root'
  group 'root'
  mode 0o644
end

bash 'extract_ioncube' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    mkdir -p #{extract_path}
    tar xvf #{src_filename} -C #{extract_path}
    mv #{extract_path}/#{node['php']['ioncube']['version']}.so #{node['php']['ioncube']['home']}/#{node['php']['ioncube']['version']}.so
    echo '#{node['php']['ioncube']['checksum']}' > #{node['php']['ioncube']['home']}/IONCUBE_VERSION
  EOH
  not_if "test `cat #{node['php']['ioncube']['home']}/IONCUBE_VERSION` = #{node['php']['ioncube']['checksum']}"
  creates "#{node['php']['ioncube']['home']}/IONCUBE_VERSION"
end