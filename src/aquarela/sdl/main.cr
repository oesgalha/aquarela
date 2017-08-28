require "./lib_sdl"
require "./extensions/lib_img"

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
