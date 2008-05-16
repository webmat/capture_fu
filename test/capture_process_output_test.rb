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

  def test_when_output_to_stderr
    res, out = capture_process_output('ewrewrtegfdghg')  #This shouldn't be a valid command on too many OSes

    # Should be reasonably OS-independent
    assert_not_equal 0, res
    assert_instance_of String, out

    # Some of the following is probably strongly OS-dependent.
    # I'm developing on OSX.
    # Comments welcome.
    assert_equal 127, res
    assert !out.empty?
  end

  def test_already_redirect_stderr
  end
end
