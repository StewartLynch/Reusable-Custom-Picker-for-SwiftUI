//
//  ContentView.swift
//  Custom Picker
//
//  Created by Stewart Lynch on 2020-08-13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var food = ""
    @State private var foodArray = ["Milk", "Apples", "Sugar", "Eggs", "Oranges", "Potatoes", "Corn", "Bread"]
    @State private var country = ""
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
                                             placeholder: "Select a food item.")
                        TextField("Select a country", text: $country)
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
                    CustomPickerView(items: foodArray.sorted(),
                                     pickerField: $food,
                                     presentPicker: $presentPicker)
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




