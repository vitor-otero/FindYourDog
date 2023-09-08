//
//  SearchView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 06/09/2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchVM()
    
    var body: some View {
        NavigationView {
            VStack {
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
                
                SearchBar(text: $viewModel.searchText, onSearch: viewModel.fetchDogBreeds)
                
                if viewModel.viewMode == .grid {
                    SearchGridView(breeds: viewModel.filteredBreeds)
                } else {
                    SearchListView(breeds: viewModel.filteredBreeds)
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}
