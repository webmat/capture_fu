require File.dirname(__FILE__) + '/test_helper'

class CaptureOutputTest < Test::Unit::TestCase
  include CaptureOutput

  def setup
    super
  end

  def test_stdout
    res, out, err = capture_output do 
      puts 'jeez'
    end
    assert_nil res
    assert_equal "jeez\n", out
    assert_nil err
  end

  def test_stderr
    res, out, err = capture_output do 
      $stderr.puts 'jeez'
    end
    assert_nil res
    assert_nil out
    assert_equal "jeez\n", err
  end

  def test_return_value
    res, out, err = capture_output do 
      'jeez'
    end
    assert_equal 'jeez', res
    assert_nil out
    assert_nil err
  end

  def test_all_outputs_at_the_same_time
    res, out, err = capture_output do 
      puts 'jeez'
      $stderr.puts 'jeez'
      'jeez'
    end
    assert_equal 'jeez', res
    assert_equal "jeez\n", out
    assert_equal "jeez\n", err
  end
end