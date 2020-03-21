require "../options"
require "../config"

module Linker
  module Commands
    abstract class Command
      def initialize(@options : Linker::Options)
      end

      abstract def run

      protected def config
        Linker::Config.parse(@options.config)
      end

      protected def print_line(label, value, offset = "\t")
        puts "#{offset}#{label}: #{value}"
      end
    end
  end
end
