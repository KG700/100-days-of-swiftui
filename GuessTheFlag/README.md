# Guess the flag
## Project 2: Days 20 - 22 of 100 Days of Swift
This application is a game to guess the flag. The game consists of 8 rounds, each round the player is presented with 3 flags and asked to guess which
belongs to a particular country. The game keeps track of the user's score, and after 8 rounds provides a game summary with the users final score. The
user can then select to restart the game.

<p align="center">
  <img width="30%" src="https://user-images.githubusercontent.com/57043346/219429975-c3632d49-13b5-404a-be03-f9c50ecf7f21.png">
</p>

## What I learned:
- How to work with `Image`s. They're stored in the `Assets.xcassets` file, and are accessed using `Image`
- `Color` is a view which means it can be added directly into a stack
- To displaying an alert, you need to attach a `boolean` variable that's bound to the state. When this is set to true the alert will display
- Embedding stacks within stacks is a way to create layouts
- Some nice display techniques such as the material effect (eg. `.thinMaterial`) and `RadialGradient`.
