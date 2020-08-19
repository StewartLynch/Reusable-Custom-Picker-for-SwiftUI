//
//  CustomPickerTextView.swift
//  Custom Picker
//
//  Created by Stewart Lynch on 2020-08-17.
//

import SwiftUI

struct CustomPickerTextView: View {
    @Binding var presentPicker: Bool
    @Binding var fieldString: String
    var caption: String
    @Binding var tag: Int
    var selectedTag: Int
    var body: some View {
        TextField(caption, text: $fieldString).disabled(true)
            .overlay(
                Button(action: {
                    tag = selectedTag
                    withAnimation {
                        presentPicker = true
                    }
                }) {
                    Rectangle().foregroundColor((Color.clear))
                }
            )
    }
}
