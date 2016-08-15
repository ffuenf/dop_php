# # # # # #
# ioncube #
# # # # # #
default['php']['ioncube']['home'] = '/usr/lib/php/ioncube'
default['php']['ioncube']['filename'] = 'ioncube_loaders_lin_x86-64.tar.gz'
default['php']['ioncube']['checksum'] = '21c37a244224420a76fc4705c43d221e6d32ff592ec633eee4f6bb6a394c6402'
default['php']['ioncube']['download_url'] = "http://downloads3.ioncube.com/loader_downloads/#{node['php']['ioncube']['filename']}"
default['php']['ioncube']['version'] = 'ioncube_loader_lin_5.5'