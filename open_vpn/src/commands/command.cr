require "../options"
require "../config"

module OpenVPN
  module Commands
    abstract class Command
      @vpn_config : String
      @pid_file : String

      def initialize(@options : Options, @config : Config)
        @vpn_config = @config[@options.destination]
        @pid_file = "/var/run/open_vpn.#{@options.destination}.pid"
      end

      abstract def run

      protected def pid : Int32
        File.read(@pid_file).strip.to_i
      end

      protected def ran? : Bool
        File.exists?(@pid_file) && Process.exists?(pid)
      end
    end
  end
end
