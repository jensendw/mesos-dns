source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_GEM_VERSION') ? (ENV['PUPPET_GEM_VERSION']).to_s : ['>= 3.3']
# json_pure 2.0.2 and above requires ruby 2.x
gem 'json_pure', '1.8.3'
gem 'json', '1.8.3'
gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper', '>= 0.8.2'
gem 'puppet-lint', '>= 2.0.0'
gem 'facter', '>= 1.7.0'
gem 'metadata-json-lint'
gem 'rspec-puppet'
#group :acceptance do
#  gem 'beaker-rspec'
#end
