//
//  SearchVM.swift
//  FindYourDog
//
//  Created by Vítor Otero on 06/09/2023.
//

import Foundation
import Combine
import Alamofire

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var dogBreeds: [BreedModel] = []
    @Published var displayMode: DisplayMode = .grid
    
    enum DisplayMode {
        case grid
        case list
    }
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                self?.fetchDogBreeds(searchText: searchText)
            }
            .store(in: &cancellables)
    }
    
    func fetchDogBreeds(searchText: String) {
        guard !searchText.isEmpty else {
            return
        }
        
        let url = API.searchURL + searchText
        
        AF.request(url).validate().responseDecodable(of: [BreedModel].self) { response in
            switch response.result {
            case .success(let breeds):
                self.dogBreeds = breeds
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
    
    var filteredBreeds: [BreedModel] {
        if searchText.isEmpty {
            return dogBreeds
        } else {
            return dogBreeds.filter { breed in
                breed.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

extension SearchViewModel: SortableBreedsViewModel {
    func sortFilteredBreedsAlphabetically() {
        self.dogBreeds = self.filteredBreeds.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
    }
}
