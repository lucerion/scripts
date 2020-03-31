require "./command"

module Linker
  module Commands
    class List < Command
      def run
        config.each do |option|
          puts option.name
          print_line("path", option.path)
          print_line("groups", groups_line(option.groups))
        end
      end

      private def groups_line(groups : Nil)
      end

      private def groups_line(group : String) : String
        group
      end

      private def groups_line(groups : Array(String)) : String
        groups.join(", ")
      end
    end
  end
end
