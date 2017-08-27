require "./lib_sdl/pixels"
require "./lib_sdl/video"

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
end
