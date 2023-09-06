//
//  BreedDetailView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI

struct BreedDetailView: View {
    @ObservedObject var viewModel: BreedDetailViewModel

    init(breed: BreedModel) {
        viewModel = BreedDetailViewModel(breed: breed)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                AsyncImage(url: viewModel.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                        .padding()
                }
          
                VStack(alignment: .center, spacing: 20) {
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
                }
            }
            .padding()
        }
        
    }
}
