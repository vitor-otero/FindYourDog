//
//  SearchBar.swift
//  FindYourDog
//
//  Created by Vítor Otero on 06/09/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: (String) -> Void
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            Button(action: {
                onSearch(text)
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Text("Search")
            }
        }
        .padding()
    }
}
