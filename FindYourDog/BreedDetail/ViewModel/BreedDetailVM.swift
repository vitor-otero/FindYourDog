//
//  BreedDetailVM.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import Foundation

class BreedDetailViewModel: ObservableObject {
    let breed: BreedModel

    init(breed: BreedModel) {
        self.breed = breed
    }

    var name: String {
        return breed.name
    }

    var imageUrl: URL? {
        return URL(string: "\(API.imageURL)/\(breed.reference_image_id).jpg")
    }

    var bredFor: String? {
        return breed.bred_for
    }

    var breedGroup: String? {
        return breed.breed_group
    }

    var lifeSpan: String? {
        return breed.life_span
    }

    var temperament: String? {
        return breed.temperament
    }

    var origin: String? {
        return breed.origin
    }

    var description: String? {
        return breed.description
    }
}


