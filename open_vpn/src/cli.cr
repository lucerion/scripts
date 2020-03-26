require "option_parser"
require "./options"
require "./config"
require "./commands/start"
require "./commands/stop"
require "./commands/restart"
require "./commands/status"

module OpenVPN
  class CLI
    COMMANDS = {
      "start"   => Commands::Start,
      "stop"    => Commands::Stop,
      "restart" => Commands::Restart,
      "status"  => Commands::Status,
    }

    def self.run(args)
      new.run(args)
    end

    def initialize
      @options = Options.new
    end

    def run(args)
      options_parser.parse(args)

      raise "Config '#{@options.config}' not found!" unless File.exists?(@options.config)
      raise "Binary '#{@options.bin}' not found!" unless File.executable?(@options.bin)

      config = Config.parse!(@options.config)
      raise "'#{@options.destination}' not found in '#{@options.config}'" unless config.has_key?(@options.destination)

      @options.command.new(@options, config).run
    end

    private def options_parser
      OptionParser.new do |option|
        option.banner = "Usage: open_vpn {start|stop|restart|status} DESTINATION [OPTIONS]"
        option.on("-c", "--config FILE", "config file. Default: #{Options::DEFAULT_CONFIG}") do |value|
          @options.config = value
        end
        option.on("--bin FILE", "executable file. Default: #{Options::DEFAULT_BIN}") do |value|
          @options.bin = value
        end
        option.on("--help", "display a usage message") do
          puts option
          exit
        end
        option.unknown_args do |value|
          if value.size == 2 && COMMANDS.keys.includes?(value.first)
            @options.command = COMMANDS[value.first]
            @options.destination = value.last
            next
          end

          puts option
          exit
        end
      end
    end
  end
end
