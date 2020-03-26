require "option_parser"
require "./options"
require "./server"
require "./menu"

module VimServer
  class CLI
    def initialize
      @options = Options.new
    end

    def self.run(args)
      new.run(args)
    end

    def run(args)
      options_parser.parse(args)
      @options.interactive_mode? ? interactive_mode(args) : non_interactive_mode(args)
    end

    private def interactive_mode(args)
      menu = Menu.new
      print_menu(menu)
      server_name = select_server(menu)

      server_name ? Server.new(server_name).open(args) : Server.new(menu.input("Server name: ")).start(args)
    end

    private def print_menu(menu)
      menu.entries = ["start new (default)"] + Server.list
      menu.print
    end

    private def select_server(menu)
      index = menu.input("Input server number: ").to_i

      correct_index = (0..Server.list.size).includes?(index)
      until correct_index
        index
      end

      index == 1 ? nil : Server.list[index - 1]
    end

    private def non_interactive_mode(args)
      Server.new(Server.first).open(args) if @options.one_server_mode?

      server = Server.new(Menu.new.input("Server name: "))
      server.exists? ? server.open(args) : server.start(args)
    end

    private def options_parser
      OptionParser.new do |option|
        option.banner = "Usage: vim-server [OPTIONS] [FILE...]"
        option.on("--interactive", "interactive mode") do
          @options.interactive_mode = true
        end
        option.on("--one-server",
          "connect automatically if only one server runned. It's not allowed in 'interactive' mode.") do
          @options.one_server_mode = true
        end
        option.on("--help", "display a usage message") do
          puts option
          exit
        end
        option.unknown_args do |value|
          if value.size >= 1
            @options.files = value
            next
          end

          puts option
          exit
        end
      end
    end
  end
end
