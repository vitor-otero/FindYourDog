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

struct BreedsView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "mockData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let mockData = try JSONDecoder().decode([BreedModel].self, from: data)
                
                let mockViewModel = BreedVM()
                mockViewModel.breeds = mockData
                
                return AnyView(BreedsView().environmentObject(mockViewModel))
            } catch let error as NSError {
                print("Error loading mock data: \(error)")
            } catch {
                print("An unknown error occurred while loading mock data.")
            }
        }
        
        return AnyView(Text("Failed to load mock data"))
    }
}




