# tomcat-all cookbook

This cookbook will install tomcat using apache's binaries.
Currently tested for tomcat 7 and CentOS 6 but it its written to work
with other tomcat versions and OS distributions also.

Tested with:

- CentOS 6.3 + Tomcat 7.0.53
- Ubuntu 12.04 + Tomcat 7.0.53

# Requirements

Developed using Chef 11.12.4
	[Berkshelf managed] ohai (2.0.0)
	[Berkshelf managed] ark (0.8.2)
	[Berkshelf managed] java (1.22.0)

# Usage

Simply include the tomcat-all recipe wherever you would like, such as a run
list (recipe[tomcat-all]) or a cookbook (include_recipe 'tomcat-all').
By default, Oracle JDK 1.7 and Tomcat 7 will be installed.

This recipe will also create a custom server.xml, catalina.sh and initd script
configured with the bellow default settings.

# Attributes

	['tomcat-all']['user'] = 'tomcat'
	* The user under tomcat will run
	
	['tomcat-all']['group'] = 'tomcat'
	* The group under tomcat will run
	
	['tomcat-all']['version'] = '7.0.53'
	* Tomcat's version to be installed
	
	['tomcat-all']['install_directory'] = '/opt'
	* The root directory where tomcat will be installed. 
	 Bellow this directory this recipe will create a symlink tomcat 
	 and extract to a folder called 'tomcat-#{version})
	 Example:
	 /opt/tomcat (symlink)
	 /opt/tomcat-7.0.53 (extract folder)

	['tomcat-all']['shutdown_port'] = '8005'
	* Tomcat shutdown port (Set to '-1' to disable remote shutdown)
	 
	['tomcat-all']['port'] = '8080'
	* Port where tomcat will listen
	 
	['tomcat-all']['max_threads'] = '100'
	* Max threads on tomcat threadpool
	 
	['tomcat-all']['min_spare_threads'] = '10'
	* Min spare threads on tomcat threadpool
	
	['tomcat-all']['java_opts'] = '-d64 -server -Djava.awt.headless=true'
	* Override to set Xmx, Xms and PermGemSize

# Recipes

	tomcat-all::default

# Author

Author:: Roberto Moutinho (robertomoutinho@gmail.com)
