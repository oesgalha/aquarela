require "./aquarela/game"
require "./aquarela/sprite"
require "./aquarela/color"

def aquarela_game(title : String, width : Int32, height : Int32)
  game = Game.new(title, width, height)
  at_exit { game.finalize }
  game.run do
    yield game
  end
end
