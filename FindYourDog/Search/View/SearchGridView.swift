//
//  SearchGridView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 06/09/2023.
//

import SwiftUI

struct SearchGridView: View {
    let breeds: [BreedModel]
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(breeds, id: \.id) { breed in
                    NavigationLink(destination: BreedDetailView(breed: breed)) {
                        VStack(spacing: 10) {
                            //MARK: - Nice to have
//                            AsyncImageView(url: URL(string: "\(API.imageURL)/\(breed.reference_image_id).jpg"))
//                                .padding(.top, 20)
//                                .aspectRatio(contentMode: .fill)
//                                .frame(maxWidth: 200, maxHeight: 200)
//                                .cornerRadius(10)
//                                .shadow(radius: 5)
                            
                            Text(breed.name)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                            
                            if let breedGroup = breed.breed_group, !breedGroup.isEmpty {
                                BreedDetailRow(title: "Breed group", detail: breedGroup)
                                
                            }
                            
                            if let origin = breed.origin, !origin.isEmpty {
                                BreedDetailRow(title: "Origin", detail: origin)
                            }
                            
                            if let temperament = breed.temperament, !temperament.isEmpty {
                                BreedDetailRow(title: "Temperament", detail: temperament)
                                
                            }
                        }.padding(15)
                        .foregroundColor(.customLightGray)
                        .background(Color.customDarkGray)
                        .cornerRadius(10)
                        
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

