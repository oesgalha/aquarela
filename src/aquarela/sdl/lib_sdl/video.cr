lib LibSDL

  WINDOWPOS_UNDEFINED = 0x1FFF0000

  struct Rect
    x, y, w, h : Int32
  end
  
  fun create_window = SDL_CreateWindow(title : UInt8*, x : Int32, y : Int32, w : Int32, h : Int32, flags : UInt32) : Void*
  fun get_window_surface = SDL_GetWindowSurface(window : Void*) : Surface*
  fun update_window_surface = SDL_UpdateWindowSurface(window : Void*) : Int32
  fun destroy_window = SDL_DestroyWindow(window : Void*)
end
