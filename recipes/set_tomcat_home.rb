# Author:: Joshua Timberman (<joshua@opscode.com>)
# Author:: Cody Sandwith (<codysandwith@gmail.com>)
# Cookbook Name:: tomcat-all
# Recipe:: set_tomcat_home
#
# Copyright 2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ruby_block 'set-env-tomcat-home' do
  block do
    ENV['TOMCAT_HOME'] = node['tomcat-all']['tomcat_home']
  end
  not_if { ENV['TOMCAT_HOME'] == node['tomcat-all']['tomcat_home'] }
end

directory '/etc/profile.d' do
  mode 00755
end

file '/etc/profile.d/tomcat.sh' do
  content "export TOMCAT_HOME=#{node['tomcat-all']['tomcat_home']}"
  mode 00755
end

ruby_block 'Set TOMCAT_HOME in /etc/environment' do
  block do
    file = Chef::Util::FileEdit.new('/etc/environment')
    file.insert_line_if_no_match(/^TOMCAT_HOME=/, "JAVA_HOME=#{node['tomcat-all']['tomcat_home']}")
    file.search_file_replace_line(/^TOMCAT_HOME=/, "JAVA_HOME=#{node['tomcat-all']['tomcat_home']}")
    file.write_file
    only_if { node['tomcat-all']['set_etc_environment'] }
  end
end
