@[Link("SDL2")]
lib LibSDL
  struct Color
    r, g, b, a : UInt8
  end

  struct Palette
    ncolors : Int32
    colors : Color*
    __version : UInt32
    __refcount : Int32
  end

  struct PixelFormat
    format : UInt32
    palette : Palette*
    bits_per_pixel, bytes_per_pixel : UInt8
    r_mask, g_mask, b_mask, a_mask : UInt32
    __r_loss, __g_loss, __b_loss, __a_loss : UInt8
    __r_shift, __g_shift, __b_shift, __a_shift : UInt8
    __refcount : Int32
    __next : PixelFormat*
  end

  fun map_rgb = SDL_MapRGB(format : PixelFormat*, r : UInt8, g : UInt8, b : UInt8) : UInt32
end
