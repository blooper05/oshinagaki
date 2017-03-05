# frozen_string_literal: true
require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

properties = YAML.load_file('properties.yml')

desc 'Run serverspec to all hosts'
task serverspec: 'serverspec:all'

namespace :serverspec do
  task all: properties.keys.map { |host| 'serverspec:' + host }

  properties.keys.each do |host|
    desc "Run serverspec to #{host}"
    RSpec::Core::RakeTask.new(host.split('.')[0].to_sym) do |t|
      ENV['TARGET_HOST'] = host
      t.pattern = 'spec/{' + properties[host][:roles].join(',') + '}/*_spec.rb'
    end
  end
end
