#
# Cookbook Name:: php
# Recipe:: php73
#
node.normal['php']['dir'] = '/etc/php'
node.normal['php']['conf_dir'] = '/etc/php/7.3/cli'
node.normal['php']['ext_conf_dir'] = '/etc/php/7.3/conf.d'

node.normal['php']['packages'] = if platform?('ubuntu')
                                   %w[
                                     php7.3-fpm
                                     php7.3-cli
                                     php7.3-dev
                                     php7.3-curl
                                     php7.3-gd
                                     php7.3-intl
                                     php7.3-imap
                                     php7.3-json
                                     php7.3-mysql
                                     php7.3-opcache
                                     php7.3-oauth
                                     php7.3-pspell
                                     php7.3-xml
                                     php7.3-soap
                                     php7.3-mbstring
                                     php7.3-zip
                                   ]
                                 else
                                   node.normal['php']['packages'] = %w[
                                     php7.3-fpm
                                     php7.3-cli
                                     php7.3-dev
                                     php7.3-curl
                                     php7.3-gd
                                     php7.3-imap
                                     php7.3-intl
                                     php7.3-json
                                     php7.3-mysql
                                     php7.3-opcache
                                     php7.3-pspell
                                     php7.3-ldap
                                     php7.3-xml
                                     php7.3-mbstring
                                   ]
                                 end
node.normal['php']['fpm']['service-name'] = 'php7.3-fpm'
node.normal['php']['fpm']['dir'] = "#{node['php']['dir']}/7.3/fpm"
node.normal['php']['fpm']['ext_conf_dir'] = "#{node['php']['fpm']['dir']}/conf.d"
node.normal['php']['fpm']['pool_dir'] = "#{node['php']['fpm']['dir']}/pool.d"
node.normal['php']['fpm']['log_dir'] = "/var/log/#{node['php']['fpm']['service-name']}"
node.normal['php']['fpm']['pidfile'] = "/var/run/#{node['php']['fpm']['service-name']}.pid"
node.normal['php']['fpm']['logfile'] = "/var/log/#{node['php']['fpm']['service-name']}/fpm-master.log"
node.normal['php']['fpm']['rotfile'] = "/etc/logrotate.d/#{node['php']['fpm']['service-name']}"
node.normal['php']['fpm']['mods_dir'] = "#{node['php']['dir']}/mods-available"
node.normal['php']['fpm']['log_dir'] = "/var/log/#{node['php']['fpm']['service-name']}"
node.normal['php']['fpm']['rotfile'] = "/etc/logrotate.d/#{node['php']['fpm']['service-name']}"
node.normal['php']['ini']['directives']['fpm'] = node['php']['fpm']['conf']
node.normal['php']['fpm']['conf']['global']['error_log'] = "#{node['php']['fpm']['log_dir']}/#{node['php']['fpm']['service-name']}.log"
node.normal['php']['fpm']['workers']['slow_filename'] = "#{node['php']['fpm']['log_dir']}/#{node['php']['fpm']['service-name']}-slow.log"

node.normal['php']['ioncube']['version'] = 'ioncube_loader_lin_7.0'
