require "./lib_sdl/video"
require "./surface"

module SDL
  class Window
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

    def surface
      @surface ||= Surface.from_window(@window)
    end

    def update
      LibSDL.update_window_surface(@window)
    end

    def finalize
      LibSDL.destroy_window(@window)
    end
  end
end
