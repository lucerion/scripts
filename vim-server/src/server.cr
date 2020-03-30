module VimServer
  class Server
    def self.list
      `vim --serverlist`.split("\n").reject! { |name| name.empty? }
    end

    def initialize(@server_name : String)
    end

    def open(args)
      start_args = args.dup.unshift("--remote-tab-silent")
      start(start_args)
    end

    def start(args)
      vim_args = args.join(" ")
      system("vim --servername #{@server_name} #{vim_args}")
      exit
    end

    def exists?
      self.class.list.includes?(@server_name)
    end
  end
end
