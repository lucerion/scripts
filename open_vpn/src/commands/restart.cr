require "./command"
require "./start"
require "./stop"

module OpenVPN
  module Commands
    class Restart < Command
      def run
        OpenVPN::Commands::Stop.new(@options, @config).run
        OpenVPN::Commands::Start.new(@options, @config).run
      end
    end
  end
end
