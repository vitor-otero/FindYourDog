//
//  BreedListView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 05/09/2023.
//

import SwiftUI

struct BreedListView: View {
    @ObservedObject var viewModel: BreedVM
    
    var body: some View {
        List(viewModel.displayedBreeds, id: \.id) { breed in
            NavigationLink(destination: BreedDetailView(breed: breed)) {
                BreedListViewRow(breed: breed, realm: viewModel.realm)
            }
            .onAppear {
                if breed == viewModel.displayedBreeds.last {
                    viewModel.fetchMoreData()
                }
            }
        }
        .listStyle(.plain)
        .padding(.horizontal, 16)
        
        if viewModel.isFetchingData {
            LoadingView(isCompact: true)
        }
    }
}

