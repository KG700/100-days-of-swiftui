# Word Scramble
## Project 5: Days 29 - 31 of 100 Days of Swift
This application is a word scramble game. The user is presented with an 8 letter word, and they have to make as many words as they can from the
letters in this word. Their score is recalculated and displayed each time the user successfully guesses a correct word. All the words that they manage 
to find are listed on the app with the score that each word was worth (equal to the number of letters in the word). The app does validation checks on
each guessed word, checking that it's at least 3 letters long, isn't the original 8 letter word, hasn't been guessed before, is possible to create with 
the 8 letter root word, and is a word in the dictionary. The user receives an alert for any invalid guesses with a meaningful message explaining why it 
wasn't accepted.

<p align="center">
  <kbd><img width="30%" src="https://user-images.githubusercontent.com/57043346/222247884-e97fbfcb-f5f9-4674-b6f2-269023151864.png"></kbd>
</p>

## What I learned:

- This was the first time working with the `List` view.
- Learned how to import in data from a text file using `Bundle.main.url()` to get the url, then `String(contentsOf: <url>)` to get the data.
- Learnt that there's a built in spellchecker (but it's not very user-friendly).
- Learnt you can use `.onAppear(<function name>)` to run some code when a view first appears.
- Reminded me about the `guard else` syntax which is good for doing guard clauses in functions.
- Used `withAnimation` to make list items slide onto the screen nicely.
- Learnt about `Image(systemName: "\(number).circle.fill")` to get a nicely formatted built in number in a circle (can do this for numbers between 0 and 50).
