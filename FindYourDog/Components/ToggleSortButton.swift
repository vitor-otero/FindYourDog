//
//  ToggleSortButton.swift
//  FindYourDog
//
//  Created by Vítor Otero on 05/09/2023.
//

import SwiftUI

protocol SortableBreedsViewModel {
    func sortFilteredBreedsAlphabetically()
}

struct ToggleSortButton<ViewModel: SortableBreedsViewModel>: View {
    @State private var isSorted = false
    var viewModel: ViewModel

    var body: some View {
        Button(action: {
            isSorted.toggle()
            viewModel.sortFilteredBreedsAlphabetically()
        }) {
            Text("Sort Alphabetically")
                .font(.headline)
                .foregroundColor(isSorted ? .white : .accentColor)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(isSorted ? Color.accentColor : Color.accentColor.opacity(0.1))
                .cornerRadius(10)
        }
    }
}
