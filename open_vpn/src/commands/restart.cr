require "./command"
require "./start"
require "./stop"

module OpenVPN
  module Commands
    class Restart < Command
      def run
        Stop.new(@options, @config).run
        Start.new(@options, @config).run
      end
    end
  end
end
