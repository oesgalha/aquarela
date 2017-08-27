@[Link("SDL2")]
lib LibSDL

  enum EventType
    QUIT = 0x100
  end

  struct CommonEvent
    ev_type, timestamp : UInt32
  end

  struct QuitEvent
    ev_type, timestamp : UInt32
  end

  union Event
    ev_type : UInt32
    common : CommonEvent
    quit : QuitEvent
  end
  
  fun pool_event = SDL_PollEvent(event : Event*) : Int32
end
