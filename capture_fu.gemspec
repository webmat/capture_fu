Gem::Specification.new do |s|
  s.name = "capture_fu"
  s.version = "0.0.1"
  s.date = "2008-05-21"
  s.summary = "capture_fu facilitates the capture of stdout and stderr output"
  s.email = "webmat@gmail.com"
  s.homepage = "http://github.com/webmat/capture_fu"
  s.description = "capture_fu is a small library that facilitates capture of stdout " +
    "and stderr output, of either subprocesses or plain old Ruby code."
  s.has_rdoc = false
  s.authors = ["Mathieu Martin"]
  s.files = %w{Rakefile README TODO lib/capture_fu.rb test/test_helper.rb test/functional/capture_output_test.rb test/functional/capture_process_output_test.rb test/unit/capture_fu_helpers_test.rb test/unit/intrusiveness_test.rb}
  s.test_files = %w{test/test_helper.rb test/functional/capture_output_test.rb test/functional/capture_process_output_test.rb test/unit/capture_fu_helpers_test.rb test/unit/intrusiveness_test.rb}
  #s.rdoc_options
  #s.extra_rdoc_files = 
  #s.add_dependency()
end