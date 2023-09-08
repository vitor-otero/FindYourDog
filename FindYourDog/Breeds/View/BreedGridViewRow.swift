//
//  DogGridViewComponent.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI
import RealmSwift

struct BreedGridViewRow: View {
    let breed: BreedModel
    let realm: Realm?
    
    var body: some View {
        VStack {
            if let breedRealm = realm?.object(ofType: BreedPersistence.self, forPrimaryKey: breed.reference_image_id),
               let imageData = breedRealm.imageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            } else {
                BreedImageLoaderView(breed: breed, realm: realm)
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                
                    .shadow(radius: 5)
            }
            Text(breed.name)
                .font(.caption).bold()
                .padding(5)
                .foregroundColor(Color.customLightGray)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        
        .background(Color.customDarkGray)
        .cornerRadius(10)
        .shadow(radius: 5)
        
        
    }
}
