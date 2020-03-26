require "file_utils"
require "./command"

module OpenVPN
  module Commands
    class Stop < Command
      def run
        return unless ran?

        Process.kill(Signal.new(Signal::KILL), pid)
        FileUtils.rm(@pid_file)
      end
    end
  end
end
