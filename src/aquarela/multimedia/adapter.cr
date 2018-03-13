module Aquarela
  module Multimedia
    abstract class Adapter
      abstract def initialize
      abstract def keyboard : Aquarela::Multimedia::Keyboard
      abstract def window : Aquarela::Multimedia::Window
      abstract def finalize
    end
  end
end
