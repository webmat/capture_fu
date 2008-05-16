require File.dirname(__FILE__) + '/test_helper'

class CaptureProcessOutputTest < Test::Unit::TestCase
  include CaptureOutput

  def setup
    super
  end

  def test_successful_execution
    result, out = capture_process_output('echo jeez')
  end
end
