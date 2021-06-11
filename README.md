# love-game-template
My template for creating games in **LÖVE**. It includes the setup for a fully functional screen management system and the libraries i use the most.

## Libraries included
* [anim8](https://github.com/kikito/anim8) - Spritesheet animation.
* [bump](https://github.com/kikito/bump.lua) - Collision detection.
* [Cartographer](https://github.com/tesselode/cartographer) - Load, read and draw Tiled maps.
* [Classic](https://github.com/rxi/classic/) - Class module for object orientation.
* [Flux](https://github.com/rxi/flux/) - lightweight tweening library.
* [gamera](https://github.com/kikito/gamera) - Camera system.
* [Push](https://github.com/Ulydev/push) - Make fixed-resolution games with ease.
* [Yonder](https://github.com/thenerdie/Yonder) - State management.

## Scene creation
When creating a scene, duplicate the ```screens/exampleScreen.lua``` file and remember to add it on the *gameStates* section of ```libs/ScreenManager.lua```. For more information, read the Yonder [documentation](https://github.com/thenerdie/Yonder).

## Resolution
This template comes with **Push** for easily creating games at fixed resolutions, since i prefer making them that way. If you want to get mouse position, just do ```push:toGame(x, y)```. Otherwise, just remove it's references from *main.lua*. Read more about Push [here](https://github.com/Ulydev/push).