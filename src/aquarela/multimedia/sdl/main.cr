require "./image"

@[Link("SDL2")]
lib LibSDL
  INIT_VIDEO          = 0x00000020
  
  fun init = SDL_Init(flags : UInt32) : Int32
  fun get_error = SDL_GetError() : UInt8*
  fun quit = SDL_Quit()
end

module SDL
  def self.init!
    LibSDL.init(LibSDL::INIT_VIDEO)
    LibIMG.init(LibIMG::IMG_INIT_PNG)
  end

  def self.finalize
    LibIMG.quit
    LibSDL.quit
  end
end
