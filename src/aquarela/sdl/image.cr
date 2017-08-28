require "./lib_sdl"

module SDL
  class Image
    def initialize(path : String)
      if (window = SDL::Window.main).nil?
        @surface = SDL::Surface.new(LibIMG.load(path))
      else
        @surface = SDL::Surface.new(LibSDL.convert_surface(LibIMG.load(path), window.surface.to_unsafe.value.format, 0))
      end
    end

    def blit #(dest : Surface)
      if !(window = SDL::Window.main).nil?
        @surface.blit(window.surface)
      end
    end
  end
end
