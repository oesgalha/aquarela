module Aquarela
  struct Color
    property r, g, b

    def initialize(@r : UInt8, @g : UInt8, @b : UInt8)
    end

    def self.white
      Color.new(255_u8, 255_u8, 255_u8)
    end
  end
end
