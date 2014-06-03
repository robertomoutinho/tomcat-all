#
# Cookbook Name:: tomcat-all
# Recipe:: default
#
# Copyright (C) 2014 Roberto Moutinho
#
# All rights reserved - Do Not Redistribute
#

# Build download URL
tomcat_version = node['tomcat-all']['version']
major_version = tomcat_version[0]
download_url = "http://archive.apache.org/dist/tomcat/tomcat-#{major_version}/v#{tomcat_version}/bin/apache-tomcat-#{tomcat_version}.tar.gz"

# Create group
group node['tomcat-all']['group']

# Create user
user node['tomcat-all']['user'] do
  group node['tomcat-all']['group']
  system true
  shell '/bin/bash'
end

# Download and unpack tomcat
ark 'tomcat' do
  url download_url
  version node['tomcat-all']['version']
  prefix_root node['tomcat-all']['install_directory']
  prefix_home node['tomcat-all']['install_directory']
  owner node['tomcat-all']['user']
  notifies :create, 'template[/etc/logrotate.d/tomcat]', :immediately
end

# Log rotation (catalina.out)
template '/etc/logrotate.d/tomcat' do
  source 'logrotate.conf.erb'
  notifies :create, "template[#{node['tomcat-all']['install_directory']}/tomcat/conf/server.xml]", :immediately
end

# Tomcat server configuration
template node['tomcat-all']['install_directory'] + "/tomcat/conf/server.xml" do
  source 'server.conf.erb'
  notifies :create, "template[#{node['tomcat-all']['install_directory']}/tomcat/bin/catalina.sh]", :immediately
end

# Tomcat catalina configuration
template node['tomcat-all']['install_directory'] + "/tomcat/bin/catalina.sh" do
  source 'catalina.conf.erb'
  notifies :create, "template[/etc/init.d/tomcat]", :immediately
end

# Tomcat init script configuration
template '/etc/init.d/tomcat' do
  source 'init.conf.erb'
  mode '0755'
  action :nothing
end

# Enabling tomcat service and starting
service 'tomcat' do
  action [:enable, :start]
end
