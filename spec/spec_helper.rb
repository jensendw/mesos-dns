require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.before :each do
    Puppet.settings[:strict_variables] = true if ENV['STRICT_VARIABLES'] == 'yes'
  end
end
