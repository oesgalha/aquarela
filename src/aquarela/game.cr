require "./sdl/lib_sdl/main"
require "./sdl/window"
require "./sdl/time"
require "./sdl/event"

module Aquarela
  class Game
    def initialize(title, width, height)
      LibSDL.init(LibSDL::INIT_VIDEO)
      @window = SDL::Window.new(title, width, height)
    end

    def run
      loop do
        @window.surface.fill(rand(255), rand(255), rand(255))
        case event = SDL::Event.pool
        when .quit?
          exit
        end
        @window.update
        wait 100
      end
    end

    def finalize
      @window.finalize
      LibSDL.quit
    end
  end
end
