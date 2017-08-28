require "./lib_sdl/event"
require "./lib_sdl/pixels"
require "./lib_sdl/surface"
require "./lib_sdl/timer"
require "./lib_sdl/video"
require "./extensions/lib_img"

@[Link("SDL2")]
lib LibSDL
  INIT_VIDEO          = 0x00000020
  
  fun init = SDL_Init(flags : UInt32) : Int32
  fun get_error = SDL_GetError() : UInt8*
  fun quit = SDL_Quit()
end