require "./command"
require "../config"

module Linker
  module Commands
    class Groups < Command
      def run
        print(by_groups)
      end

      def print(groups)
        groups.each do |(group, options)|
          puts group
          options.each { |option| print_line(option.name, option.path) }
        end
      end

      private def by_groups
        config.each_with_object({} of String => Array(Config)) do |option, accumulator|
          add_to_group(option.groups, accumulator, option)
        end
      end

      private def add_to_group(groups : Nil, list, option)
        add_to_group("without category", list, option)
      end

      private def add_to_group(groups : Array(String), list, option)
        groups.each { |group| add_to_group(group, list, option) }
      end

      private def add_to_group(group : String, list, option)
        list[group] ||= [] of Config
        list[group] << option
      end
    end
  end
end
