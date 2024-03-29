require "option_parser"
require "./options"
require "./commands/link"
require "./commands/list"
require "./commands/groups"

module Linker
  class CLI
    alias Args = Array(String)

    USAGE_MESSAGE = <<-USAGE
      Usage: linker COMMAND [OPTIONS]

      Commands:
        link                  link projects
        link groups           link by groups only
        list                  list of projects
        groups                list of projects by groups
        groups list           list of groups
        groups <group name>   projects of group <group name>

      Options:
    USAGE

    COMMANDS = {
      "link"   => Commands::Link,
      "list"   => Commands::List,
      "groups" => Commands::Groups,
    }

    def initialize
      @options = Linker::Options.new
    end

    def self.run(args : Args)
      new.run(args)
    end

    def run(args : Args)
      options_parser.parse(args)
      raise "Config file '#{@options.config}' not found!" unless File.exists?(@options.config)
      @options.command.new(@options).run
    end

    private def options_parser : OptionParser
      OptionParser.new do |option|
        option.banner = USAGE_MESSAGE
        option.on("-c", "--config FILE", "config file. Default: #{Options::DEFAULT_CONFIG}") do |value|
          @options.config = value
        end
        option.on("-d", "--destination DIR",
          "destination directory. Default: #{Options::DEFAULT_DESTINATION}") do |value|
          @options.destination = value
        end
        option.on("--help", "display a usage message") do
          puts option
          exit
        end
        option.unknown_args do |args|
          if args.empty?
            @options.command = COMMANDS["link"]
            next
          end

          if args.size >= 1 && COMMANDS.keys.includes?(args.first)
            @options.command = COMMANDS[args.first]
            @options.command_args = args[1..-1] if args.size >= 2
            next
          end

          puts option
          exit
        end
      end
    end
  end
end
