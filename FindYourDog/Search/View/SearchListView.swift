//
//  SearchListView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 06/09/2023.
//

import SwiftUI

struct SearchListView: View {
    let breeds: [BreedModel]
    
    var body: some View {
       
            List(breeds) { breed in
                NavigationLink(destination: BreedDetailView(breed: breed)) {
                    HStack(spacing: 10) {
                        //MARK: - Nice to have
//                            AsyncImageView(url: URL(string: "\(API.imageURL)/\(breed.reference_image_id).jpg"))
//                                .padding(.top, 20)
//                                .aspectRatio(contentMode: .fill)
//                                .frame(maxWidth: 200, maxHeight: 200)
//                                .cornerRadius(10)
//                                .shadow(radius: 5)
                        
                        VStack {
                            Text(breed.name)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                                .padding(.bottom,15)
                            
                            if let breedGroup = breed.breed_group, !breedGroup.isEmpty {
                                BreedDetailRow(title: "Breed group", detail: breedGroup)
                                
                            }
                            
                            if let origin = breed.origin, !origin.isEmpty {
                                BreedDetailRow(title: "Origin", detail: origin)
                            }
                            
                            if let temperament = breed.temperament, !temperament.isEmpty {
                                BreedDetailRow(title: "Temperament", detail: temperament)
                                
                            }
                        }
                        
                    }.foregroundColor(.customDarkGray)
                        .padding(.horizontal, 10)
                }
            }
            .listStyle(.plain)
            .padding(.horizontal, 16)
            .navigationBarHidden(true)
    }
}
