require "../../../src/aquarela"

include Aquarela

game = Game.new(title: "Pong", width: 640, height: 480)
at_exit { game.finalize }

game.run do
  puts "TODO"
end
