//
//  API.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import Foundation

struct API {
    static let baseURL = "https://api.thedogapi.com/v1"
    
    static let imageURL = "https://cdn2.thedogapi.com/images"
    
    static func breedImageURL(referenceImageID: String) -> URL? {
        return URL(string: "\(baseURL)/images/\(referenceImageID).jpg")
    }
    
}

