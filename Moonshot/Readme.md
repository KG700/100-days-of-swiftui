# Moonshot
## Project 8: Days 39 - 42 of 100 Days of Swift
This is an application to learn about NASA missions and astronauts. The application contains json data which is loaded into the application.
The application displays the Apollo missions, which can be clicked on to display more details about the mission.

<p align="center">
  <img width="30%" src="https://user-images.githubusercontent.com/57043346/225128865-a7ec1fd8-7e93-47d4-828c-703324260ab5.png">
</p>


## What I learned:

- How to load data by creating an extension to Bundle to load a json file by doing a series of guard checks in make sure the file can be found, loaded and 
decoded. Also learned how to do this with generically for all data types.
- How to format dates by adding this to the Bundle extension.
- How to display items using `GridItem` so items can be displayed in rows or columns, and are adaptative to different screensizes and orientations.
- How to use `ScrollView` to make content scrollable, and `NavigationLink` as a way to bring in a new view (an alternative to `sheet`).
- You can imbed a struct inside a struct. This can be a useful way to keep your code tidy if you're defining a struct that's specifically for another
struct, which often happens when defining data.
- A good way to set colour themes is to create an extension to the `ShapeStyle`.
