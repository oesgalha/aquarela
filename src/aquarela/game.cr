require "./sdl"

module Aquarela
  class Game

    getter key_pressed : LibSDL::Keycode

    def initialize(title, width, height)
      @adapter = Aquarela::Multimida::Adapter[:sdl]
      @adapter.intitialize!
      @window = @adapter.window.new(title, width, height)
      # SDL::Window.new()
      # SDL::Window.main = @window
      @key_pressed = @adapter.keyboard.keys.unknown
      # LibSDL::Keycode::UNKNOWN
    end

    def run
      loop do
        # @window.surface.fill(0_u8, 0_u8, 0_u8)
        # @key_pressed = LibSDL::Keycode::UNKNOWN
        @key_pressed = @adapter.keyboard.keys.unknown
        handle_events
        yield
        @window.update
        wait 16_u32
      end
    end

    def handle_events
      while !(event = SDL::Event.pool).nil?
        case event
        when .key_down?
          @key_pressed = event.key
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
