//
//  MainView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            BreedsView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Dog List")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Dog Search")
                }
                .tag(1)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "mockData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let mockData = try JSONDecoder().decode([BreedModel].self, from: data)
                
                let mockViewModel = BreedVM()
                mockViewModel.breeds = mockData
                
                return AnyView(MainView().environmentObject(mockViewModel))
            } catch let error as NSError {
                print("Error loading mock data: \(error)")
            } catch {
                print("An unknown error occurred while loading mock data.")
            }
        }
        
        return AnyView(Text("Failed to load mock data"))
    }
}
