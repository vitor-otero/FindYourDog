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
            
            // Second Tab (Search View)
          
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
        MainView()
    }
}
