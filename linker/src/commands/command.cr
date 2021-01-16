require "../options"
require "../config"

module Linker
  module Commands
    abstract class Command
      getter options

      def initialize(@options : Options)
      end

      abstract def run

      protected def config : Array(Config)
        Config.parse(options.config)
      end

      protected def print_line(label : String, value : String | Nil, offset = "\t")
        puts "#{offset}#{label}: #{value}"
      end
    end
  end
end
