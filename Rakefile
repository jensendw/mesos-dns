require 'bundler'
Bundler.require(:rake)
require 'rake/clean'

require 'rspec-puppet/rake_task'
require 'puppetlabs_spec_helper/rake_tasks'
require 'metadata-json-lint/rake_task'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-lint/optparser'

PuppetLint::OptParser.build.parse!(['--no-140chars-check'])

desc 'Run acceptance tests'
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end

desc "Lint metadata.json file"
task :meta do
      sh "metadata-json-lint metadata.json"
end

Rake::Task[:lint].clear
PuppetLint::RakeTask.new :lint do |config|
      config.ignore_paths = ["spec/**/*.pp", "vendor/**/*.pp", "pkg/**/*.pp"]
      config.log_format = '%{path}:%{linenumber}:%{KIND}: %{message}'
      config.fail_on_warnings = true
end

desc 'Run metadata_lint, lint, syntax, and spec tests.'
task test: [
  :metadata_lint,
  :lint,
  :syntax,
  :spec
]
