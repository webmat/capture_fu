require File.dirname(__FILE__) + '/../test_helper'

#These test names are made for rSpec, I know.

class CaptureFuNotIncludedByDefaultTest < Test::Unit::TestCase

  def test__method__not_polluting_namespace_when_not_explicitly_included
    assert_raise(NoMethodError) do
      res, out, err = capture_output do 
        puts 'jeez'
      end
    end
  end
end

class CaptureFuNotIntrusiveWhenIncludedTest < Test::Unit::TestCase
  include CaptureFu

  def test__utility_classes__not_polluting_namespace_when_not_explicitly_included
    assert_raise(NameError) do
      PipeStealer.new
    end
  end

  def test__utility_methods__not_polluting_namespace
    assert_raise(NoMethodError) do 
      stderr_already_redirected('echo jeez')
    end
  end
end

