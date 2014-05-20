# tomcat-all cookbook

This cookbook will install tomcat using apache's binaries.
Currently tested for tomcat 7 and CentOS 6 but it its written to work
with other tomcat versions and OS distributions also.

# Requirements

Developed under Chef 11.12.4
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
['tomcat-all']['group'] = 'tomcat'
['tomcat-all']['version'] = '7.0.53'
['tomcat-all']['install_directory'] = '/opt'
['tomcat-all']['shutdown_port'] = '8005'
['tomcat-all']['port'] = '8080'
['tomcat-all']['max_threads'] = '100'
['tomcat-all']['min_spare_threads'] = '10'
['tomcat-all']['java_opts'] = '-d64 -server -Djava.awt.headless=true'

# Recipes

tomcat-all::default

# Author

Author:: Roberto Moutinho (robertomoutinho@gmail.com)
