module VimServer
  class MenuItem
    def initialize(@title : String, @position : Int32)
    end

    def print
      puts "#{@position}: #{@title}"
    end
  end
end
