@[Link("SDL2")]
lib LibSDL

  enum EventType
    QUIT = 0x100
    USER_EVENT = 0x8000
  end

  struct CommonEvent
    ev_type : EventType
    timestamp : UInt32
  end

  struct QuitEvent
    ev_type : EventType
    timestamp : UInt32
  end

  struct UserEvent
    ev_type : EventType
    timestamp : UInt32
    windowID : UInt32
    code : Int32
    data1 : Void*
    data2 : Void*
  end

  union Event
    ev_type : EventType
    common : CommonEvent
    quit : QuitEvent
    user : UserEvent
  end
  
  fun pool_event = SDL_PollEvent(event : Event*) : Int32
end
