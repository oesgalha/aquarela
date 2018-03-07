lib LibSDL
  fun delay = SDL_Delay(ms : UInt32)
end

def wait(ms : UInt32)
  LibSDL.delay(ms)
end
