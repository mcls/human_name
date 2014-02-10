require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

desc 'Run mutation tests'
task :mutant do
  system 'bundle exec mutant --include lib --require "human_name" --use rspec ::HumanName*'
end
