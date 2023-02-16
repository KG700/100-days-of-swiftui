# WeSplit
## Project 1: Days 16 - 18 of 100 Days of Swift
This application is designed to help users split a bill between more than one person. The app allows the user to enter the bill amount, select the number
of people that the bill needs to be split between, and the percentage of tip that they would like to pay (if any). The app will then calculate the total
bill including the tip, and work out the amount that each person needs to pay.

<p align="center">
  <img width="30%" src="https://user-images.githubusercontent.com/57043346/219434380-e6b5bfdf-91a8-4399-ad7a-1f3cfada65ea.png">
</p>

## What I learned
- `NavigationView` is a good way to ensure that the views can't overlap the status bar at the top of the screen when a user scrolls on the screen.
- `Forms` can contain a maximum of 10 views.
- `Sections` can be used to group fields.
- Use `@State` and `@FocusState` to keep track of state variables
- You can modify the type of keyboard that's being displayed using `.keyboardType` on the view that requires a keyboard. Number keboard types include
  `.numberPad` and `.decimalPad`. The difference between these are that the `.decimalPad` includes a decimal point button.
- `Locale` gives you access to information about the user. This application uses this to determine what currency is likely to be the most appropriate
  to use.
- `Spacer()` can be used to help place items where you want them on the screen.
