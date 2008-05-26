#Not very DRY vs Rakefile
Gem::Specification.new do |s|
  s.name        = 'capture_fu'
  s.version     = '0.0.1'
  s.summary     = "capture_fu facilitates the capture of stdout and stderr output"

  s.authors     << "Mathieu Martin"
  s.email       = "webmat@gmail.com"
  s.homepage    = "http://github.com/webmat/capture_fu"
  s.description = "capture_fu is a small library that facilitates capture of stdout " +
    "and stderr output, of either subprocesses or plain old Ruby code."

  s.test_files  = %w{test/capture_output_test.rb
                    test/functional/capture_output_test.rb test/functional/capture_process_output_test.rb 
                    test/unit/capture_output_test.rb test/unit/intrusiveness_test.rb}
  s.files       = %w{Rakefile README TODO lib/capture_fu.rb} + s.test_files

  s.has_rdoc    = false
end
