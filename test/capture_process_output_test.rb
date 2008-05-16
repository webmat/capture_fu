require File.dirname(__FILE__) + '/test_helper'

class CaptureProcessOutputTest < Test::Unit::TestCase
  include CaptureOutput

  def setup
    super
  end

  def test_successful_execution
    res, out = capture_process_output('echo jeez')
    assert_equal 0, res
    assert_equal "jeez\n", out
  end
end
