//
//  BreedImageLoaderView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI
import RealmSwift

struct BreedImageLoaderView: View {
    let breed: BreedModel
    let realm: Realm?
    
    var body: some View {
        if let breedRealm = realm?.object(ofType: BreedPersistence.self, forPrimaryKey: breed.reference_image_id),
           let imageData = breedRealm.imageData,
           let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            AsyncImageView(url: URL(string: "\(API.imageURL)/\(breed.reference_image_id).jpg"))
                .aspectRatio(contentMode: .fit)
        }
    }
    
    func breedImageData() -> Data? {
        guard let realm = realm else { return nil }
        if let breedRealm = realm.object(ofType: BreedPersistence.self, forPrimaryKey: breed.reference_image_id) {
            return breedRealm.imageData
        }
        return nil
    }
}

