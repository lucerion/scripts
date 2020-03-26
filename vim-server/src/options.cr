module VimServer
  class Options
    setter interactive_mode = false
    setter one_server_mode = false
    property files = [] of String

    def interactive_mode?
      @interactive_mode
    end

    def one_server_mode?
      @one_server_mode && files.one?
    end
  end
end
