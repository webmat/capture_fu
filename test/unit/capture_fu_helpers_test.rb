require File.dirname(__FILE__) + '/../test_helper'

class CaptureFuHelpersTest < Test::Unit::TestCase
  include CaptureFu

  #stderr_already_redirected

  def test_clean_command
    assert ! Helpers.stderr_already_redirected('echo')
  end

  def test_command_with_stderr_merged_to_stdout
    ['echo 2>&1', 'echo 2>&1 ', 'echo    2>&1'].each do |cmd|
      assert Helpers.stderr_already_redirected(cmd)
    end
  end

  def test_command_with_stderr_ignored
    ['echo 2>/dev/null', 'echo 2>/dev/null ', 'echo    2>/dev/null'].each do |cmd|
      assert Helpers.stderr_already_redirected(cmd)
    end
  end


  #PipeStealer

  #TODO
end