
template "#{node['tomcat-all']['tomcat_home']}/conf/tomcat-users.xml" do
  source 'tomcat-users.xml.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
      :users => TomcatAll::TomcatUsers.tomcat_users(node['tomcat-all']['tomcat_users_data_bag'] , node['tomcat-all']['tomcat_users_search']),
      :roles => TomcatAll::TomcatUsers.tomcat_roles
  )
end