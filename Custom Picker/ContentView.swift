//
//  ContentView.swift
//  Custom Picker
//
//  Created by Stewart Lynch on 2020-08-13.
//

import SwiftUI

struct ContentView: View, CustomPicker {
    
    @State private var food = ""
    @State private var foodArray = ["Milk", "Apples", "Sugar", "Eggs", "Oranges", "Potatoes", "Corn", "Bread"]
    @State private var country = ""
    @StateObject private var countriesVM = CountryViewModel()
    @State private var tag: Int = 1
    @State private var presentPicker = false

    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Color("Background")
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        CustomPickerTextView(presentPicker: $presentPicker,
                                             fieldString: $food,
                                             tag: $tag,
                                             selectedTag: 1)
                        CustomPickerTextView(presentPicker: $presentPicker,
                                             fieldString: $country,
                                             tag: $tag,
                                             selectedTag: 2)
                        Image("Working")
                            .resizable()
                            .frame(width: 400)
                            .scaledToFit()
                        Spacer()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 250)
                    .navigationBarTitle("Picker Demo")
                }
            }
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
        }
    }
    
    func saveUpdates(_ newItem: String) {
        foodArray.append(newItem)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


