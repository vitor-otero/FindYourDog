//
//  BreedToggleButton.swift
//  FindYourDog
//
//  Created by Vítor Otero on 05/09/2023.
//

import SwiftUI

struct BreedToggleButton: View {
    @ObservedObject var viewModel: BreedVM
    
    var body: some View {
        HStack {
            ToggleButton(title: "Grid", selected: viewModel.viewMode == .grid) {
                viewModel.viewMode = .grid
            }
            
            ToggleButton(title: "List", selected: viewModel.viewMode == .list) {
                viewModel.viewMode = .list
            }
            Spacer()
            ToggleSortButton(viewModel: viewModel)
        }
        .padding()
    }
}
