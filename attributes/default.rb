# O.S. related settings
default['tomcat-all']['user'] = 'tomcat'
default['tomcat-all']['group'] = 'tomcat'
default['tomcat-all']['tomcat_users_data_bag'] = 'tomcat_users'
default['tomcat-all']['tomcat_users_search'] = '*:*'



# Tomcat related settings
default['tomcat-all']['logrotate_enabled'] = true

## installation
default['tomcat-all']['version'] = '7.0.61'
default['tomcat-all']['tomcat_home'] = '/opt/tomcat'
default['tomcat-all']['set_etc_environment'] = false
default['tomcat-all']['download_server'] = 'http://archive.apache.org/'

## configuration
default['tomcat-all']['shutdown_port'] = '8005'
default['tomcat-all']['port'] = '8080'
default['tomcat-all']['max_threads'] = '100'
default['tomcat-all']['min_spare_threads'] = '10'
default['tomcat-all']['java_opts'] = '-d64 -server -Djava.awt.headless=true'
default['tomcat-all']['catalina_opts'] = ''
default['tomcat-all']['accept_count'] = '100'
default['tomcat-all']['connection_timeout'] = '20000'
default['tomcat-all']['max_http_header_size'] = '8192'
default['tomcat-all']['access_log_enabled'] = true



# SSL Connector
default['tomcat-all']['ssl_enabled'] = false
default['tomcat-all']['ssl_port'] = ''
default['tomcat-all']['keystore_file'] = ''
default['tomcat-all']['keystore_pass'] = ''
default['tomcat-all']['keystore_type'] = ''

# Lockout Realm
default['tomcat-all']['lockout_realm_enabled'] = true
default['tomcat-all']['lockout_realm_classname'] = 'org.apache.catalina.realm.UserDatabaseRealm'
default['tomcat-all']['lockout_realm_resourcename'] = 'UserDatabase'
default['tomcat-all']['lockout_realm_datasourcename'] = ''
default['tomcat-all']['lockout_realm_usertable'] = ''
default['tomcat-all']['lockout_realm_usernamecol'] = ''
default['tomcat-all']['lockout_realm_usercredcol'] = ''
default['tomcat-all']['lockout_realm_userroletable'] = ''
default['tomcat-all']['lockout_realm_roleNameCol'] = ''
default['tomcat-all']['lockout_realm_localdatasource'] = ''
default['tomcat-all']['lockout_realm_digest'] = ''

# SSO
default['tomcat-all']['SSO_enabled'] = false

# Cluster
default['tomcat-all']['cluster_class'] = '' # Must be set to non-blank for Farm Deployment to work

# Farm Deployment
default['tomcat-all']['farm_deploy_enabled'] = false
default['tomcat-all']['farm_deploy_classname'] = ''
default['tomcat-all']['farm_deploy_tempdir'] = ''
default['tomcat-all']['farm_deploy_deploydir'] = ''
default['tomcat-all']['farm_deploy_watchdir'] = ''
default['tomcat-all']['farm_deploy_watchenabled'] = ''
