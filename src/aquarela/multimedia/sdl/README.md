# Simple DirectMedia Layer

A _non-complete_ binding to SDL2.

The objective here is to add only what seems to be necessary to the development of the tool/framework.

The mantainer of this project don't have previous experience with SDL, maybe this project won't need everything it offers to build this project, maybe this assumption is wrong and thus this may turn into a complete binding to SDL2.
If this happen this folder shall be exported as a separate shard/lib.

## Why another binding?

There is hope to support plataforms beyond the ones supported by Crystal language: Windows, Android and iOS.

First Windows, then the others.

The available bindings are either:

* Too old (use SDL1.2 or older versions of Crystal)
  * SDL2 have a more permissive license
  * Crystal is not stable (1.0) yet, so maybe stuff still works, maybe not
* The most recent, updated and maintained by an active community member binding lib does not work on Windows. (This is not a bug/defect, but an effort to support multiplatforms is desired here, so the binding is not adequate to this project)

## Styleguide

### -> One file per category

One file per category from SDL2, the file must have the same name as the category.

Those are the categories: http://wiki.libsdl.org/APIByCategory

Why: It's easier to find where an enum, function or struct from SDL is inside the project.

Example: The `video.cr` contains enums, structs and functions from the [video category](http://wiki.libsdl.org/CategoryVideo).

### -> Use the `type` constructor inside `lib` declaration groups for `Void` pointers

When binding to a function that returns a void pointer, use a `type` expression to enforce correctness.

Why: This will make the crystal compiler check if the correct pointers are passed to the binded function. 

Example:
The `SDL_Renderer` struct depends on the available drivers and hardware running the application. So `SDL_Renderer` is not a pre-defined struct (the code does not known the fields and size it will have when the application is running), it is an [opaque type](https://en.wikipedia.org/wiki/Opaque_data_type). Function that returns `SDL_Renderer` pointers actually return `void` pointers, this is how C deals with opaque types. Other functions that accepts an `SDL_Renderer` pointer will accept any void pointer, but a wrong pointer can cause a runtime error.

This kind of runtime error can be prevented here using the `type` keyword:
```crystal
lib LibSDL
  type SDL_Renderer = Void

  fun destroy_renderer = SDL_DestroyRenderer(renderer : SDL_Renderer*)
end
```
Now whenever the code calls `LibSDL.destroy_renderer(some_renderer)` the compiler will check and guarantee that `some_renderer` is a valid `SDL_Renderer` pointer. If `some_renderer` is a pointer to other struct, the compiler will fail and point the error.

This means less runtime errors: less annoyance for users and less bugs to developers. Neat.

Read more info here: https://crystal-lang.org/docs/syntax_and_semantics/c_bindings/type.html

### => Build structs as crystal structs with the `Extern` attribute

hmmm

