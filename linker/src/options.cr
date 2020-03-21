require "./commands/command"

module Linker
  class Options
    DEFAULT_CONFIG      = "~/.config/linker.yml"
    DEFAULT_DESTINATION = "."

    setter config = DEFAULT_CONFIG
    setter destination = DEFAULT_DESTINATION
    property command = Linker::Commands::Command

    def config
      File.expand_path(@config, home: true)
    end

    def destination
      File.expand_path(@destination, home: true)
    end
  end
end
