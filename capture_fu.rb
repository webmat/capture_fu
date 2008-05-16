module CaptureOutput

  def capture_output(&block)
    real_out, real_err = $stdout, $stderr
    result = fake_out = fake_err = nil
    begin
      fake_out, fake_err = HelperClasses::PipeStealer.new, HelperClasses::PipeStealer.new
      $stdout, $stderr = fake_out, fake_err
      result = yield
    ensure
      $stdout, $stderr = real_out, real_err
    end
    return result, fake_out.captured, fake_err.captured
  end

  # This first implementation is only intended for batch executions.
  # You can't pipe stuff programmatically to the child process.
  def capture_process_output(command)
    out = `#{command}`
    return $?, out
  end


  private

  module HelperClasses
    class PipeStealer < File
      attr_reader :captured
      def initialize
        @captured = ''
      end
      def write(s)
        @captured << s
      end
      def captured
        return nil if @captured.empty?
        @captured.dup
      end
    end
  end
end
