# Word Scramble
## Project 5: Days 29 - 31 of 100 Days of Swift
This application is a word scramble game. The user is presented with an 8 letter word, and they have to make as many words as they can from the
letters of that word. All the words that they manage to find are listed on the app with the number of letters beside each guessed word.

<p align="center">
  <img width="30%" src="https://user-images.githubusercontent.com/57043346/221411155-0215f23a-82d4-4219-8468-867e21cd2b82.png">
</p>

## What I learned:

- This was the first time working with the `List` view.
- Learned how to import in data from a text file using `Bundle.main.url()` to get the url, then `String(contentsOf: <url>)` to get the data.
- Learnt that there's a built in spellchecker (but it's not very user-friendly).
- Learnt you can use `.onAppear(<function name>)` to run some code when a view first appears.
- Reminded me about the `guard else` syntax which is good for doing guard clauses in functions.
- Used `withAnimation` to make list items slide onto the screen nicely.
- Learnt about `Image(systemName: "\(number).circle.fill")` to get a nicely formatted built in number in a circle (can do this for numbers between 0 and 50).
