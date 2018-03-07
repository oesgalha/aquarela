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

module SDL
  struct Event

    @event : LibSDL::Event

    def initialize(@event)
    end

    def self.pool
      LibSDL.pool_event(out event) == 1 ? Event.new(event) : nil
    end

    def quit?
      @event.ev_type == LibSDL::EventType::QUIT
    end
  end
end
