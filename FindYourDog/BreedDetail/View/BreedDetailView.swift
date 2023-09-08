//
//  BreedDetailView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI
import UIKit

struct BreedDetailView: View {
    @ObservedObject var viewModel: BreedDetailViewModel
    
    init(breed: BreedModel) {
        viewModel = BreedDetailViewModel(breed: breed)
    }
    
    var body: some View {
        ScrollView {
            //MARK: - Nice to have
            //            VStack(alignment: .center, spacing: 20) {
            //                AsyncImage(url: viewModel.imageUrl) { image in
            //                    image
            //                        .resizable()
            //                        .scaledToFit()
            //                        .frame(width: 200, height: 200)
            //                        .cornerRadius(10)
            //                } placeholder: {
            //                    Image("no-image")
            //                        .resizable()
            //                        .scaledToFit()
            //                        .frame(width: 200, height: 200)
            //                        .cornerRadius(10)
            //                }
            //
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                Text(viewModel.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let breedGroup = viewModel.bredFor {
                    BreedDetailRow(title: "Breed Category", detail: breedGroup)
                    
                }
                
                if let origin = viewModel.origin, !origin.isEmpty {
                    BreedDetailRow(title: "Origin", detail: origin)
                }
                
                if let temperament = viewModel.temperament {
                    BreedDetailRow(title: "Temperament", detail: temperament)
                }
            }.foregroundColor(.customDarkGray)
            // }
                .padding()
        }
        
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Load mock data from "mockData.json"
        if let url = Bundle.main.url(forResource: "mockData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let mockData = try JSONDecoder().decode([BreedModel].self, from: data)
                
                if let firstBreed = mockData.first {
                    return AnyView(BreedDetailView(breed: firstBreed))
                }
            } catch let error as NSError {
                print("Error loading mock data: \(error)")
            } catch {
                print("An unknown error occurred while loading mock data.")
            }
        }
        return AnyView(Text("Failed to load mock data"))
    }
}
