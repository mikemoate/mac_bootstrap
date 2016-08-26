#
# Author:: Mike Moate (<chef@mikemoate.co.uk>)
# Cookbook Name:: mac_bootstrap
# Recipe:: default
#

# Install Homebrew package manager
include_recipe 'homebrew::default'

# Install Homebrew Cask tap
include_recipe 'homebrew::cask'

# Install Homebrew completions tap
homebrew_tap 'homebrew/completions'

# Install formulae/packages (list is defined in attributes)
include_recipe 'homebrew::install_formulas'

# Install Casks (list is defined in attributes)
include_recipe 'homebrew::install_casks'

# copy over bash_profile with customisations for completion
cookbook_file "/Users/#{node['configured_user']}/.bash_profile" do
  source '.bash_profile'
end
