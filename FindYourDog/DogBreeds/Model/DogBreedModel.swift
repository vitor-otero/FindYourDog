//
//  DogBreedModel.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import Foundation

struct DogBreedModel: Identifiable, Decodable, Equatable {
    let id: Int
    let name: String
    let reference_image_id: String
    let weight: Weight
    let height: Height
    let bred_for: String?
    let breed_group: String?
    let life_span: String?
    let temperament: String?
    let origin: String?
    let description: String?
    
    struct Weight: Decodable, Equatable {
        let metric: String
    }
    
    struct Height: Decodable, Equatable {
        let imperial: String
        let metric: String
    }
  
    static func == (lhs: DogBreedModel, rhs: DogBreedModel) -> Bool {
    
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.reference_image_id == rhs.reference_image_id &&
        lhs.weight == rhs.weight &&
        lhs.height == rhs.height &&
        lhs.bred_for == rhs.bred_for &&
        lhs.breed_group == rhs.breed_group &&
        lhs.life_span == rhs.life_span &&
        lhs.temperament == rhs.temperament &&
        lhs.origin == rhs.origin &&
        lhs.description == rhs.description
    }
}
