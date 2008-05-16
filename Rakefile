require 'rake'
require 'rake/testtask'
require 'fileutils'
include FileUtils


Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

task :default => :test
