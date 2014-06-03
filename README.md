# tomcat-all cookbook

This cookbook will install tomcat using apache's binaries and extract it to the desired path.

Tested with:

- CentOS 6.3 + Tomcat 7.0.53
- Ubuntu 12.04 + Tomcat 7.0.53

# Requirements

Developed using
	Chef Development Kit 0.1.0
	Chef-client 11.12.4
	Vagrant 1.6.3

# Usage

Simply include the tomcat-all recipe wherever you would like, such as a run
list (recipe[tomcat-all]) or a cookbook (include_recipe 'tomcat-all').
By default, Oracle JDK 1.7 (JDK & JAVA_HOME) and Tomcat 7 will be installed.

This recipe will also create a custom server.xml, catalina.sh and init script
configured with the bellow default settings if no other settings is provided.

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
