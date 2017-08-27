@[Link("SDL2")]
lib LibSDL
  INIT_VIDEO          = 0x00000020
  
  fun init = SDL_Init(flags : UInt32) : Int32
  fun quit = SDL_Quit()
end
