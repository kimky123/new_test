require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'test'

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

task :default => :features