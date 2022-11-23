require "./cli"

module VimServer
  class Server
    def self.list : Array(String)
      `vim --serverlist`.split("\n").reject! { |name| name.empty? }
    end

    def initialize(@server_name : String)
    end

    def open(args : CLI::Args)
      start_args = args.dup.unshift("--remote-tab-silent")
      start(start_args)
    end

    def start(args : CLI::Args)
      vim_args = args.join(" ")
      system("vim --servername #{@server_name} #{vim_args}")
      exit
    end

    def exists? : Bool
      self.class.list.includes?(@server_name)
    end
  end
end
