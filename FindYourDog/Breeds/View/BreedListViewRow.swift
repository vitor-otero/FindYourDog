//
//  ListViewDetail.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI
import RealmSwift

struct BreedListViewRow: View {
    let breed: BreedModel
    let realm: Realm?
    
    var body: some View {
        HStack(spacing: 10) {
            if let breedRealm = realm?.object(ofType: BreedPersistence.self, forPrimaryKey: breed.reference_image_id),
               let imageData = breedRealm.imageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
            } else {
                BreedImageLoaderView(breed: breed, realm: realm)
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
            }
            Text(breed.name)
                .font(.headline)
                .lineLimit(1)
                .foregroundColor(.primary)
            Spacer()
        }
    .background(Color.white)
    }
}

