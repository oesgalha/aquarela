require "./color"

module Aquarela
  class Sprite
    property x : Int32, y : Int32
    property w : Int32, h : Int32

    def initialize(@x, @y, @w, @h, @color : Aquarela::Color)
      @rect = SDL::Rect.new(@x, @y, @w, @h)
    end

    def update
      @rect.x = @x
      @rect.y = @y
      SDL::Window.main.surface.fill_rect(@color.r, @color.g, @color.b, pointerof(@rect))
    end

    def finalize
      
    end
  end
end
