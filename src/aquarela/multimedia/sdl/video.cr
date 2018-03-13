module SDL
  @[Extern]
  struct Rect
    property x : Int32, y : Int32, w : Int32, h : Int32

    def initialize(@x, @y, @w, @h)
    end
  end
end

# Bindings to functions from the Video category of SDL2:
# http://wiki.libsdl.org/CategoryVideo
lib LibSDL

  enum WindowPos
    Undefined = 0x1FFF0000
  end

  alias Rect = SDL::Rect
  type Window = Void
  
  fun create_window = SDL_CreateWindow(title : UInt8*, x : WindowPos, y : WindowPos, w : Int32, h : Int32, flags : UInt32) : Window*
  fun get_window_surface = SDL_GetWindowSurface(window : Window*) : Surface*
  fun update_window_surface = SDL_UpdateWindowSurface(window : Window*) : Int32
  fun destroy_window = SDL_DestroyWindow(window : Window*)
end

module SDL
  class Window

    @@main : SDL::Window?

    def initialize(@title : String, @width : Int32, @height : Int32)
      @window_ptr = LibSDL.create_window(@title, LibSDL::WindowPos::Undefined, LibSDL::WindowPos::Undefined, @width, @height, 0)
    end

    def surface
      @surface ||= Surface.from_window(@window_ptr)
    end

    def self.main=(window)
      @@main = window
    end

    def self.main : SDL::Window
      if (window = @@main).nil?
        raise "This won't happen"
        Window.new("Dead code running", 0, 0)
      else
        window
      end
    end

    def update
      LibSDL.update_window_surface(@window_ptr)
    end

    def finalize
      LibSDL.destroy_window(@window_ptr)
    end

    def to_unsafe
      @window_ptr
    end
  end
end

