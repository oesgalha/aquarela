require "./pixels" 

lib LibSDL
  struct Surface
    __flags : UInt32
    format : PixelFormat*
    w, h, pitch : Int32
    pixels, userdata : Void*
    __locked : Int32
    __lock_data : Void*
    clip_rect : Rect
    __map : Void*
    refcount : Int32
  end

  fun fill_rect = SDL_FillRect(dst : Surface*, rect : Rect*, color : UInt32) : Int32
  fun blit_surface = SDL_UpperBlit(src : Surface*, srcrect : Rect*, dst : Surface*, dstrect : Rect*) : Int32
  fun convert_surface = SDL_ConvertSurface(src : Surface*, fmt : PixelFormat*, flags : UInt32) : Surface*
end


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

    def fill_rect(r, g, b, rect)
      LibSDL.fill_rect(@surface, rect, LibSDL.map_rgb(@surface.value.format, r, g, b))
    end

    def blit(dest : Surface)
      LibSDL.blit_surface(@surface, nil, dest, nil)
    end

    def to_unsafe
      @surface
    end
  end
end
