require "./commands/command"

module OpenVPN
  class Options
    DEFAULT_CONFIG = "~/.config/open_vpn.yml"
    DEFAULT_BIN    = "/usr/sbin/openvpn"

    setter config = DEFAULT_CONFIG
    setter bin = DEFAULT_BIN
    property command = Commands::Command
    property destination : String?

    def config
      File.expand_path(@config, home: true)
    end

    def bin
      File.expand_path(@bin, home: true)
    end
  end
end
