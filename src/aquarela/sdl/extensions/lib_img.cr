@[Link("SDL2_image")]
lib LibIMG

  IMG_INIT_PNG  = 2

  fun init = IMG_Init(flags : Int32) : Int32
  fun load = IMG_Load(file : UInt8*) : LibSDL::Surface*
  fun quit = IMG_Quit()
end
