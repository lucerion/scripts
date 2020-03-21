require "./command"

module Linker
  module Commands
    class List < Command
      def run
        config.each do |option|
          puts option.name
          print_line("path", option.path)
          print_line("groups", groups_string(option.groups))
        end
      end

      private def groups_string(group)
        group.is_a?(Array) ? group.join(", ") : group
      end
    end
  end
end
