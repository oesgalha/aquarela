require "./sdl"

module Aquarela
  class Game
    def initialize(title, width, height)
      SDL.init!
      @window = SDL::Window.new(title, width, height)
    end

    def run
      loop do
        yield
        handle_events
        @window.update
        wait 100_u32
      end
    end

    def handle_events
      while !(event = SDL::Event.pool).nil?
        case event
        when .quit?
          exit
        end
      end
    end

    def finalize
      @window.finalize
      SDL.finalize
    end
  end
end
