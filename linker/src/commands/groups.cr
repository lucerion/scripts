require "./command"
require "../config"

module Linker
  module Commands
    class Groups < Command
      alias Configs = Array(Config)
      alias ConfigsDictionary = Hash(String, Configs)

      SUBCOMMANDS = {
        list: "list"
      }

      def run
        if options.command_args.empty?
          print(by_groups)
          exit
        end

        groups = by_groups.keys
        group = options.command_args.first

        if group == SUBCOMMANDS[:list]
          groups.each { |group| puts group }
          exit
        end

        unless groups.includes?(group)
          puts "Group '#{group}' not found"
          exit
        end

        print(by_groups[group], "")
      end

      private def print(groups : ConfigsDictionary)
        groups.each do |(group, options)|
          puts group
          print(options)
        end
      end

      private def print(options : Configs, offset = "\t")
        options.each { |option| print_line(option.name, option.path, offset) }
      end

      private def by_groups : ConfigsDictionary
        config.each_with_object(ConfigsDictionary.new) do |option, accumulator|
          add_to_group(option.groups, accumulator, option)
        end
      end

      private def add_to_group(groups : Nil, list : ConfigsDictionary, option : Config)
        add_to_group("without category", list, option)
      end

      private def add_to_group(groups : Array(String), list : ConfigsDictionary, option : Config)
        groups.each { |group| add_to_group(group, list, option) }
      end

      private def add_to_group(group : String, list : ConfigsDictionary, option : Config)
        list[group] ||= [] of Config
        list[group] << option
      end
    end
  end
end
