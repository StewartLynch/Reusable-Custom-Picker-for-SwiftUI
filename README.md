# Reusable CustomPicker for SwiftUI

This is the completed playground for the YouTube video of the same name

The starter project and video is available in the notes for the video.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=wMQ3HQ6aCTo
" target="_blank"><img src="http://img.youtube.com/vi/wMQ3HQ6aCTo/0.jpg" 
alt="Reusable Custom Picker for SwiftUI" width="480" height="360" border="10" /></a>

## Checklist for implementing CustomPicker

- [ ] Conform to CustomPicker (this will require the addition of the saveUpdates function.  If you are not allowing updates to the array in any of your pickers you can just leave the function block empty).

  ````swift
  struct ContentView: View, CustomPicker
  ````

  ````swift
  func saveUpdates(_ newItem: String) {
     // Leave body empty if you are not allowing updates to the list
  }
  ````

- [ ] Add a string state variable for your each of you customPickerTextFields.  this will be bound to the corresponding TextField

  ````swift
  @State private var fieldName = ""
  ````

- [ ] Add a property that will access provide access to the corresponding string array.

  ````swift
  // example
  @State private var foodArray = ["Milk", "Apples", "Sugar", "Eggs", "Oranges", "Potatoes", "Corn", "Bread"]
  ````

  or, it could be a viewModel that has a property that you will be able to generate the array from.

  ````swift
  @StateObject private var countriesVM = CountryViewModel()
  ````

- [ ] Create a tag state variable that is initialized as an integer of 1

  ````swift
  @State private var tag: Int = 1
  ````

- [ ] Create a boolean state variable called presentPicker

  ````swift
  @State private var presentPicker = false
  ````

- [ ] In your content view, create your custom picker text views making sure that you assign a tag, even if there is only one picker.

  ````swift
  CustomPickerTextView(presentPicker: $presentPicker,
                       fieldString: $food,
                       tag: $tag,
                       selectedTag: 1)
  CustomPickerTextView(presentPicker: $presentPicker,
                       fieldString: $country,
                       tag: $tag,
                       selectedTag: 2)
  ````

  

- [ ] Embed your View in a ZStack.

  ````swift
  ZStack {
    NavigationView{ // You may not have a NavigationView
      // your content
    }
  }
  ````

- [ ] In the font most (bottom ) view of the ZStack, use the if pesentPicker block to check which view you want to present based on the tag and present your CustomPickerView and make sure you include .zIndex(1)

  ````swift
  if presentPicker {
      if tag == 1 {
          CustomPickerView(items: foodArray.sorted(),
                           pickerField: $food,
                           presentPicker: $presentPicker,
                           saveUpdates: saveUpdates)
              .zIndex(1)
      } else {
          CustomPickerView(items: countriesVM.countryNamesArray,
                           pickerField: $country,
                           presentPicker: $presentPicker)
              .zIndex(1.0)
      }
  }
  ````

  

- [ ] And Finally, if any of your custom picker views allow updates. Check the tag if necessary and provide the functiosn that will add the selected string to the array.

  ````swift
  func saveUpdates(_ newItem: String) {
    if tag == 1 {
      // code for updating the array for tag 1
    } else if tag == 2 {
      // code for updating the array for tag 2
    }
    // more checks if needed
  }
  ````

  


