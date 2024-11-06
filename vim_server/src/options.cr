module VimServer
  class Options
    setter interactive_mode = false
    setter single_mode = false
    property files = [] of String

    def interactive_mode? : Bool
      @interactive_mode
    end

    def single_mode? : Bool
      @single_mode
    end
  end
end
