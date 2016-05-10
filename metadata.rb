name 'mac_bootstrap'
maintainer 'Mike Moate'
maintainer_email 'chef@mikemoate.co.uk'
license 'MIT'
description 'Installs/Configures mac_bootstrap'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

supports 'mac_os_x'

depends 'homebrew', '~> 2.1.0'
