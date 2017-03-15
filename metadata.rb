name 'mac_bootstrap'
maintainer 'Mike Moate'
maintainer_email 'chef@mikemoate.co.uk'
license 'MIT'
description 'Installs/Configures mac_bootstrap'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

supports 'mac_os_x', '~> 10.11'

depends 'homebrew', '~> 3.0.0'
depends 'mac_os_x', '~> 1.4.6'

source_url 'https://github.com/mikemoate/mac_bootstrap' if respond_to?(:source_url)
issues_url 'https://github.com/mikemoate/mac_bootstrap/issues' if respond_to?(:issues_url)
