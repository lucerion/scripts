require "./command"

module OpenVPN
  module Commands
    class Status < Command
      def run
        message = ran? ? "OpenVPN is running" : "OpenVPN is not running"
        puts message
      end
    end
  end
end
