//
//  SearchView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 06/09/2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel() 
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Picker("Display Mode", selection: $viewModel.displayMode) {
                        Text("Grid").tag(SearchViewModel.DisplayMode.grid)
                        Text("List").tag(SearchViewModel.DisplayMode.list)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Spacer()
                    ToggleSortButton(viewModel: viewModel)
                    
                }
                .padding()
                SearchBar(text: $viewModel.searchText, onSearch: viewModel.fetchDogBreeds)
                
                
                if viewModel.displayMode == .grid {
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
