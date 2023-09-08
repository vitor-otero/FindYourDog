//
//  ToggleButton.swift
//  FindYourDog
//
//  Created by Vítor Otero on 05/09/2023.
//

import SwiftUI

struct ToggleButton: View {
    var title: String
    var selected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(selected ? .customLightGray : .customDarkGray)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(selected ? Color.customDarkGray : Color.customLightGray)
                .cornerRadius(10)
        }
    }
}
