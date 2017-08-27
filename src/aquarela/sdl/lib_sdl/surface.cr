require "./video"
require "./pixels"

@[Link("SDL2")]
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
end
