require "./menu_item"

module VimServer
  class Menu
    getter entries = [] of MenuItem

    def entries=(items : Array(String))
      @entries = items.map_with_index { |item, index| MenuItem.new(item, index) }
    end

    def print
      @entries.each { |entry| entry.print }
    end

    def input(message : String) : String
      text = ""

      loop do
        print message
        text = STDIN.gets || ""
        break unless text.empty?
      end

      text
    end
  end
end
