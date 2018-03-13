require "./keyboard"

lib LibSDL

  enum EventType
    QUIT = 0x100
    KEYDOWN = 0x300
    KEYUP
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

  struct KeyboardEvent
    ev_type : EventType
    timestamp : UInt32
    windowID : UInt32
    state : UInt8
    repeat : UInt8
    padding2 : UInt8
    padding3 : UInt8
    keysym : Keysym
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
    key : KeyboardEvent
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

    def key
      @event.key.keysym.sym
    end

    def keydown?
      @event.ev_type == LibSDL::EventType::KEYDOWN
    end

    def quit?
      @event.ev_type == LibSDL::EventType::QUIT
    end
  end
end
