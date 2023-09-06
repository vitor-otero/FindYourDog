//
//  LoadingView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI

struct LoadingView: View {
    var isCompact: Bool = false
    
    var body: some View {
        if isCompact {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(1.25)
        } else {
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .font(.headline)
                .padding()
        }
    }
}
