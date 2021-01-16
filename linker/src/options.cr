require "./commands/command"

module Linker
  class Options
    DEFAULT_CONFIG      = "~/.config/linker.yml"
    DEFAULT_DESTINATION = "."

    setter config = DEFAULT_CONFIG
    setter destination = DEFAULT_DESTINATION
    property command = Commands::Command
    property command_args = [] of String

    def config : String
      File.expand_path(@config, home: true)
    end

    def destination : String
      File.expand_path(@destination, home: true)
    end
  end
end
