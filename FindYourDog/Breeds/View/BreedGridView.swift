//
//  GridView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 05/09/2023.
//

import SwiftUI

struct BreedGridView: View {
    @ObservedObject var viewModel: BreedVM
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(viewModel.displayedBreeds, id: \.id) { breed in
                    NavigationLink(destination: BreedDetailView(breed: breed)) {
                        BreedGridViewRow(breed: breed, realm: viewModel.realm)
                    }
                    .onAppear {
                        if breed == viewModel.displayedBreeds.last {
                            viewModel.fetchMoreData()
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            
            if viewModel.isFetchingData {
                LoadingView(isCompact: true)
            }
        }
    }
}

