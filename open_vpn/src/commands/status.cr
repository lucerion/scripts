require "./command"

module OpenVPN
  module Commands
    class Status < Command
      def run
        puts ran? ? "OpenVPN is running" : "OpenVPN is not running"
      end
    end
  end
end
