require 'rubygems'

require 'rake'
require 'rake/testtask'
require 'rake/gempackagetask'

require 'yaml'
require 'fileutils'
include FileUtils

require 'ruby-debug'

NAME = 'capture_fu'
_VERSION = '0.0.1'

windows = (RUBY_PLATFORM =~ /win32|cygwin/) rescue nil
install_home = ENV['GEM_HOME'] ? "-i #{ENV['GEM_HOME']}" : ""
SUDO = windows ? "" : "sudo"


spec = Gem::Specification.new do |s|
  s.name        = NAME
  s.version     = _VERSION
  s.summary     = "capture_fu facilitates the capture of stdout and stderr output"

  s.authors     << "Mathieu Martin"
  s.email       = "webmat@gmail.com"
  s.homepage    = "http://github.com/webmat/capture_fu"
  s.description = "capture_fu is a small library that facilitates capture of stdout " +
    "and stderr output, of either subprocesses or plain old Ruby code."

  s.files       = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'test/**/*.rb']
  s.test_files  = FileList['test/**/*.rb']

  s.has_rdoc    = false
end


Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

task :default => :test


namespace :gem do

  #Friggin' task doesn't work! wtf?
  task(:update_gemspec) do
    File.open("#{NAME}.gemspec", 'w') do |f| 
      f.write(spec.to_yaml)
    end
  end

  #Creates clobber_package, gem,  package, repackage tasks
  #Note on clobber_package: fortunately, this will clobber the CODE package
  Rake::GemPackageTask.new(spec) do |pkg| 
    pkg.need_tar = true 
  end

  #Tasks gleaned from merb-core's Rakefile

  desc "Run :package and install the resulting .gem"
  task :install => :gem do
    sh %{#{SUDO} gem install #{install_home} --local pkg/#{NAME}-#{_VERSION}.gem --no-rdoc --no-ri}
  end

  desc "Run :clean and uninstall the .gem"
  task :uninstall do
    sh %{#{SUDO} gem uninstall #{NAME}}
  end
end
