//
//  BreedVM.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import Foundation
import RealmSwift

enum SortOrder {
    case ascending
    case descending
}

enum ViewMode {
    case list
    case grid
}

class BreedVM: ObservableObject {
    @Published var breeds: [BreedModel] = []
    @Published var isLoading = true
    @Published var isFetchingData = false
    @Published var sortOrder: SortOrder = .ascending
    @Published var viewMode: ViewMode = .grid
    
    var realm: Realm?
    var displayedBreeds: [BreedModel] {
            switch viewMode {
            case .list:
                return breeds
            case .grid:
                return breeds
            }
        }
    private var currentPage = 0
    private let itemsPerPage = 15
    
    init() {
        initializeRealm()
        fetchBreeds()
    }
    
    private func initializeRealm() {
        do {
            realm = try Realm()
        } catch {
            print("Error initializing Realm: \(error)")
        }
    }
    
    private func fetchBreeds() {
        guard let url = URL(string: "\(API.baseURL)/breeds?page=\(currentPage)&limit=\(itemsPerPage)") else { return }
        
        isFetchingData = true
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                
                do {
                    let decodedData = try JSONDecoder().decode([BreedModel].self, from: data)
                    DispatchQueue.main.async {
                        self.breeds.append(contentsOf: decodedData)
                        self.saveBreedsToRealmIfNeeded(decodedData)
                        self.isLoading = false
                        self.isFetchingData = false
                        self.currentPage += 1
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    private func saveBreedsToRealmIfNeeded(_ breeds: [BreedModel]) {
        guard let realm = realm else { return }
        
        try? realm.write {
            for breed in breeds {
                if realm.object(ofType: BreedPersistence.self, forPrimaryKey: breed.reference_image_id) == nil,
                   let imageData = downloadImageData(for: breed) {
                    let breedRealm = BreedPersistence()
                    breedRealm.id = breed.reference_image_id
                    breedRealm.name = breed.name
                    breedRealm.referenceImageId = breed.reference_image_id
                    breedRealm.imageData = imageData
                    realm.add(breedRealm, update: .modified)
                }
            }
        }
    }
    
    private func downloadImageData(for breed: BreedModel) -> Data? {
        guard let imageURL = URL(string: "\(API.imageURL)/\(breed.reference_image_id).jpg") else { return nil }
        if let imageData = try? Data(contentsOf: imageURL) {
            return imageData
        }
        return nil
    }
    
    func fetchMoreData() {
        guard !isFetchingData, breeds.count % itemsPerPage == 0 else {
            return
        }
        fetchBreeds()
    }
    
    func sortBreedsAlphabetically() {
        breeds.sort { $0.name < $1.name }
        
        // Update self.breeds with the sorted array
        self.breeds = breeds
    }
    
    func resetPagination() {
        currentPage = 0
    }
}
