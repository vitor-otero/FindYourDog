//
//  SearchGridView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 06/09/2023.
//

import SwiftUI

struct SearchGridView: View {
    let breeds: [BreedModel]
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(breeds, id: \.id) { breed in
                    NavigationLink(destination: BreedDetailView(breed: breed)) {
                        VStack(spacing: 15) {
                            //TODO: - Need to fix the requirements and the display style
                            AsyncImageView(url: URL(string: "\(API.imageURL)/\(breed.reference_image_id).jpg"))
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .cornerRadius(10)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            Text(breed.name)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                        }
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

