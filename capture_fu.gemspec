require 'rake'
Gem::Specification.new do |s|
  s.name        = 'capture_fu'
  s.version     = '0.0.1'
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
