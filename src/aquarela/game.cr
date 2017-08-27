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
				@window.surface.fill(255, 0, 0)
				event = SDL::Event.pool
				#case event
				#when Nil
					
				#when .quit?
				#	finalize
				#end
				@window.update
				wait 1000
				finalize
			end
		end

		def finalize
			@window.finalize
			LibSDL.quit
		end
	end
end
