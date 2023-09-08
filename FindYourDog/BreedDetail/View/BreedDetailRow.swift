//
//  BreedDetailRow.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI

struct BreedDetailRow: View {
    let title: String
    let detail: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.customMediumGray)
            Spacer()
            Text(detail)
                .font(.subheadline)
        }
        .padding(.horizontal)
    }
}

