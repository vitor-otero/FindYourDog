//
//  BreedsView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI

struct BreedsView: View {
    @ObservedObject private var viewModel = BreedVM()
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    BreedToggleButton(viewModel: viewModel)
                    
                    if viewModel.viewMode == .list {
                        BreedListView(viewModel: viewModel)
                    } else {
                        BreedGridView(viewModel: viewModel)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .accentColor(.blue)
    }
}





