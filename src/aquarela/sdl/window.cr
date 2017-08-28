require "./lib_sdl"

module SDL
  class Window

    @@main : SDL::Window | Nil

    def initialize(@title : String, @width : Int32, @height : Int32)
      @window = LibSDL.create_window(
          @title,
          LibSDL::WINDOWPOS_UNDEFINED,
          LibSDL::WINDOWPOS_UNDEFINED,
          @width,
          @height,
          0
      )
    end

    def self.main
      @@main
    end

    def self.main=(window)
      @@main = window
    end

    def surface
      @surface ||= SDL::Surface.from_window(@window)
    end

    def update
      LibSDL.update_window_surface(@window)
    end

    def finalize
      LibSDL.destroy_window(@window)
    end
  end
end
