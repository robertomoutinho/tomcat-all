name             'tomcat-all'
maintainer       'Roberto Moutinho'
maintainer_email 'robertomoutinho@gmail.com'
license          'All rights reserved'
description      'Installs/Configures tomcat'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.4'

depends 'ark', '~> 0.9'
depends 'java'
depends 'apt', '~> 2.7'

supports 'ubuntu', '= 12.04'
supports 'centos', '>= 6.4'
supports 'redhat', '>= 6.4'
