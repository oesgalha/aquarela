require "./lib_sdl/event"

module SDL
  struct Event

    @event : LibSDL::Event | Nil

    def initialize(@event)
    end

    def self.pool
      if LibSDL.pool_event(out event) == 1
        return Event.new(event)
      else
        return Event.new(nil)
      end
    end

    def quit?
      has_type?(LibSDL::EventType::QUIT)
    end

    def has_type?(ev_type)
      (event = @event).responds_to?(:ev_type) && event.ev_type == ev_type
    end
  end
end
