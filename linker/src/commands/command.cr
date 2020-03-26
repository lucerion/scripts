require "../options"
require "../config"

module Linker
  module Commands
    abstract class Command
      def initialize(@options : Options)
      end

      abstract def run

      protected def config
        Config.parse(@options.config)
      end

      protected def print_line(label, value, offset = "\t")
        puts "#{offset}#{label}: #{value}"
      end
    end
  end
end
