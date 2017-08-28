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
