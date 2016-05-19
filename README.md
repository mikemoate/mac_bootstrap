# mac_bootstrap
## Description
This cookbook and associated shell script automate the setup and configuration of a machine running OS X. This is a developer workstation focused setup, installing applications, command line tools and configuring OS X settings.

## Platform
- Mac OS X (10.11+)

## Requirements
* Opscode chef-client `https://docs.chef.io/install_omnibus.html` (for local mode)
* Cookbooks:
  * homebrew `https://supermarket.chef.io/cookbooks/homebrew` (for package management on OS X)
  * mac_os_x `https://supermarket.chef.io/cookbooks/mac_os_x` (for managing OS X defaults and plists)

## Usage
```bash
curl -L https://raw.githubusercontent.com/mikemoate/mac_bootstrap/master/mac_bootstrap.sh | bash
```
