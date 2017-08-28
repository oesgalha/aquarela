require "./lib_sdl"

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
