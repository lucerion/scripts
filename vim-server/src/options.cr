module VimServer
  class Options
    setter interactive_mode = false
    setter one_server_mode = false
    property files = [] of String

    def interactive_mode? : Bool
      @interactive_mode
    end

    def one_server_mode? : Bool
      @one_server_mode
    end
  end
end
