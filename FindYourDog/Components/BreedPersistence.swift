//
//  BreedRealm.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import Foundation
import RealmSwift

class BreedPersistence: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var referenceImageId = ""
    @objc dynamic var imageData: Data?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
