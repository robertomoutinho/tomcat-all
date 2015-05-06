# tomcat-all cookbook

This cookbook will install tomcat using apache's binaries and extract it to the desired path.

Tested with test-kitchen + serverspec:

- CentOS 6.6 + Tomcat 7.0.53
- Ubuntu 12.04 + Tomcat 7.0.53

# Requirements

Developed using
	Chef Development Kit 0.1.0
	Chef-client 11.12.4
	Vagrant 1.6.3

# Usage

Simply include the tomcat-all recipe wherever you would like, such as a run
list (recipe[tomcat-all]) or a cookbook (include_recipe 'tomcat-all').
Requires "java" recipe (for java install and node['java']['java_home']).

This recipe will also create a custom server.xml, catalina.sh and init script
configured with the bellow default settings if no other settings is provided.

Tomcat Users
---------------------
The recipe `tomcat-all::users` included in this cookbook is used for managing Tomcat users. The recipe adds users and roles to the `tomcat-users.xml` conf file.

Users are defined by creating a `tomcat_users` data bag and placing [Encrypted Data Bag Items](http://docs.chef.io/chef/essentials_data_bags.html) in that data bag. Each encrypted data bag item requires an 'id', 'password', and a 'roles' field.

```javascript
{
    "id": "user1",
    "password": "somepassword",
    "roles": [
        "manager-gui",
        "admin"
    ]
}
```


# Attributes

>> Default values provided as example only

* `['tomcat-all']['user'] = 'tomcat'` - The user under tomcat will run

* `['tomcat-all']['group'] = 'tomcat'` - The group under tomcat will run

* `['tomcat-all']['version'] = '7.0.53'` - Tomcat's version to be installed

* `['tomcat-all']['install_directory'] = '/opt'` - The root directory where tomcat will be installed.
 Bellow this directory this recipe will create a symlink tomcat and extract to a folder called 'tomcat-#{version}).
 Example: creates `/opt/tomcat` as a symbolic link to `/opt/tomcat-7.0.53` (tomcat actual folder)

* `['tomcat-all']['shutdown_port'] = '8005'` - Tomcat shutdown port (Set to '-1' to disable remote shutdown)

* `['tomcat-all']['port'] = '8080'` - Port where tomcat will listen

* `['tomcat-all']['max_threads'] = '100'` - Max threads on tomcat threadpool

* `['tomcat-all']['min_spare_threads'] = '10'` - Min spare threads on tomcat threadpool

* `['tomcat-all']['java_opts'] = '-d64 -server -Djava.awt.headless=true'` - JAVA_OPTS configuration

* `['tomcat-all']['catalina_opts'] = ''` - CATALINA_OPTS configuration

* `["tomcat-all"]["ssl_enabled"] = false` - Enable SSL [Connector](http://tomcat.apache.org/tomcat-7.0-doc/config/http.html). Must also set ssl_port (see below)

* `["tomcat-all"]["ssl_port"] = ''` - The port to listen on for SSL Connections

* `["tomcat-all"]["keystore_file"] = ''` - Absolute path to the SSL Keystore file

* `["tomcat-all"]["keystore_pass"] = ''` - SSL Keystore file password

* `["tomcat-all"]["keystore_type"] = ''` - SSL Keystore file type (e.g. 'JKS')

* `["tomcat-all"]["lockout_realm_enabled"] = true` - Enable default [LockoutRealm](http://tomcat.apache.org/tomcat-7.0-doc/config/realm.html#LockOut_Realm_-_org.apache.catalina.realm.LockOutRealm) and configures a realm inside it (see below).

* `["tomcat-all"]["lockout_realm_classname"] = 'org.apache.catalina.realm.UserDatabaseRealm'` - Realm inside of LockoutRealm className

* `["tomcat-all"]["lockout_realm_resourcename"] = 'UserDatabase'` - Realm inside of LockoutRealm resourceName (if it has one)

* `["tomcat-all"]["lockout_realm_datasourcename"] = ''` - Realm inside of LockoutRealm datasourceName (if it has one)

* `["tomcat-all"]["lockout_realm_usertable"] = ''` - Realm inside of LockoutRealm userTable (if it has one)

* `["tomcat-all"]["lockout_realm_usernamecol"] = ''` - Realm inside of LockoutRealm userNameCol (if it has one)

* `["tomcat-all"]["lockout_realm_usercredcol"] = ''` - Realm inside of LockoutRealm userCredCol (if it has one)

* `["tomcat-all"]["lockout_realm_userroletable"] = ''` - Realm inside of LockoutRealm userRoleTable (if it has one)

* `["tomcat-all"]["lockout_realm_roleNameCol"] = ''` - Realm inside of LockoutRealm roleNameCol (if it has one)

* `["tomcat-all"]["lockout_realm_localdatasource"] = ''` - Realm inside of LockoutRealm localDatasource (if it has one)

* `["tomcat-all"]["lockout_realm_digest"] = ''` - Realm inside of LockoutRealm digest (if it has one)

* `["tomcat-all"]["SSO_enabled"] = false` - Enable default [SingleSignOn Valve](http://tomcat.apache.org/tomcat-7.0-doc/config/valve.html#Single_Sign_On_Valve)

* `["tomcat-all"]["cluster_class"] = ''` - [Cluster](http://tomcat.apache.org/tomcat-7.0-doc/config/cluster.html) class (must be set for Farm Deployment to work. See below)

* `["tomcat-all"]["farm_deploy_enabled"] = false` - Enables [Farm Deployment](http://tomcat.apache.org/tomcat-7.0-doc/config/cluster-deployer.html) (must set properties below as well)

* `["tomcat-all"]["farm_deploy_classname"] = ''` - Deployer className

* `["tomcat-all"]["farm_deploy_tempdir"] = ''` - Deployer tempDir

* `["tomcat-all"]["farm_deploy_deploydir"] = ''` - Deployer deployDir

* `["tomcat-all"]["farm_deploy_watchdir"] = ''` - Deployer watchDir

* `["tomcat-all"]["farm_deploy_watchenabled"] = ''` - Deployer watchEnabled

# Example Config

```
	default_attributes(
	  "java" => {
	    "install_flavor" => "oracle",
	    "jdk_version" => 7,
	    "oracle" => {
	      "accept_oracle_download_terms" => true
	    }
	  },
	  "tomcat-all" => {
	    "user" => "tomcat",
	    "group" => "tomcat",
	    "version" => "7.0.53",
	    "install_directory" => "/opt",
	    "shutdown_port" => "-1",
	    "port" => "8080",
	    "max_threads" => "500",
	    "min_spare_threads" => "100",
	    "java_opts" => "-d64 -server -Djava.awt.headless=true -Xms3072m -Xmx3072m -XX:MaxPermSize=512m"
	  }
	)
```

# Recipes

	tomcat-all::default

# Author

Author:: Roberto Moutinho (robertomoutinho@gmail.com)
