require "../../../src/aquarela"

include Aquarela
include Aquarela::Shapes

player_paddle   = Rectangle.new x: 0,               y: (480 - 92) / 2, w: 32, h: 92, background: Color.white
computer_paddle = Rectangle.new x: 640 - 32,        y: (480 - 92) / 2, w: 32, h: 92, background: Color.white
ball            = Rectangle.new x: (640 - 32) / 2,  y: (480 - 32) / 2, w: 32, h: 32, background: Color.white

aquarela_game(title: "Pong", width: 640, height: 480) do |game|
  case game.key_pressed
  when .up?
    player_paddle.y -= 4
  when .down?
    player_paddle.y += 4
  end
  # player_paddle.update
  # computer_paddle.update
  # ball.update
end
