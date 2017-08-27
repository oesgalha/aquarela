require "./lib_sdl/event"

module SDL
  module Event
    struct CommonEvent
      property event : LibSDL::Event

      def initialize(@event : LibSDL::Event)
      end

      def quit?
        @event.ev_type == LibSDL::EventType::QUIT
      end
    end

    def self.pool
      puts "eita"
      if LibSDL.pool_event(out event) != 0
        puts "woop woop"
        return CommonEvent.new(event)
      else
        puts "oh damn"
      end
    end
  end
end
