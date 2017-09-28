use_inline_resources

action :add do
  Chef::Log.info("Creating new PHP-FPM instance for #{new_resource.name}")
  a = template "#{node['php']['fpm']['pool_dir']}/#{new_resource.name}.conf" do
    cookbook 'php'
    source 'fpm-instance.erb'
    owner 'root'
    group 'root'
    variables(
      name: new_resource.name,
      user: new_resource.user,
      group: new_resource.group,
      catch_workers_output: new_resource.catch_workers_output,
      ip_address: new_resource.ip_address,
      port: new_resource.port,
      socket: new_resource.socket,
      socket_path: new_resource.socket_path,
      socket_user: new_resource.socket_user,
      socket_group: new_resource.socket_group,
      socket_perms: new_resource.socket_perms,
      ip_whitelist: new_resource.ip_whitelist,
      max_children: new_resource.max_children,
      start_servers: new_resource.start_servers,
      min_spare_servers: new_resource.min_spare_servers,
      max_spare_servers: new_resource.max_spare_servers,
      max_requests: new_resource.max_requests,
      backlog: new_resource.backlog,
      status_url: new_resource.status_url,
      ping_url: new_resource.ping_url,
      ping_response: new_resource.ping_response,
      log_filename: new_resource.log_filename,
      log_format: new_resource.log_format,
      slow_filename: new_resource.slow_filename,
      slow_timeout: new_resource.slow_timeout,
      valid_extensions: new_resource.valid_extensions,
      terminate_timeout: new_resource.terminate_timeout,
      initial_directory: new_resource.initial_directory,
      flag_overrides: new_resource.flag_overrides,
      value_overrides: new_resource.value_overrides,
      env_overrides: new_resource.env_overrides
    )
    notifies :restart, "service[#{node['php']['fpm']['service-name']}]" unless node['php']['fpm']['containerize']
    mode 0o644
  end

  service node['php']['fpm']['service-name'] do
    action :nothing
  end
end

action :remove do
  Chef::Log.info("Removing PHP-FPM instance #{new_resource.name}")

  a = file "#{node['php']['fpm']['pool_dir']}/#{new_resource.name}.conf" do
    action :delete
    notifies :restart, "service[#{node['php']['fpm']['service-name']}]"
    not_if { node['php']['fpm']['containerize'] }
  end

  service node['php']['fpm']['service-name'] do
    action :nothing
  end
end
