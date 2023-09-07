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
                NavigationLink(destination: BreedDetailView(breed: breed)) { // Add NavigationLink
                    HStack(spacing: 10) {
                        //TODO: - Need to fix the requirements and the display style
                        AsyncImageView(url: URL(string: "\(API.imageURL)/\(breed.reference_image_id).jpg"))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                        
                        Text(breed.name)
                            .font(.headline)
                            .lineLimit(1)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .background(Color.white)
                }
            }
            .listStyle(.plain)
            .padding(.horizontal, 16)
            .navigationBarHidden(true)
    }
}
