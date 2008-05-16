require File.dirname(__FILE__) + '/../test_helper'

class CaptureProcessOutputTest < Test::Unit::TestCase
  include CaptureFu

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
    assert_match /ewrewrtegfdghg/, out
  end

  def test_ignored_stderr
    res, out = capture_process_output('ewrewrtegfdghg  2>/dev/null')

    #May not be OS-independent
    assert out.empty?
  end

  def test_already_redirected_stderr
    res, out = capture_process_output('ewrewrtegfdghg 2>&1')

    #May not be OS-independent
    assert !out.empty?
    assert_match /ewrewrtegfdghg/, out
  end
end
