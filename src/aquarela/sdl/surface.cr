require "./lib_sdl"

module SDL
  class Surface
    def initialize(surface : Pointer(LibSDL::Surface))
      @surface = surface
    end

    def self.from_window(window) : Surface
      return self.new(LibSDL.get_window_surface(window))
    end

    def fill(r, g, b)
      LibSDL.fill_rect(@surface, nil, LibSDL.map_rgb(@surface.value.format, r, g, b))
    end

    def blit(dest : Surface)
      LibSDL.blit_surface(@surface, nil, dest, nil)
    end

    def to_unsafe
      @surface
    end
  end
end
