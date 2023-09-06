//
//  RemoteImageView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    let url: URL?
    
    var body: some View {
        if let uiImage = imageLoader.image {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        } else {
            ProgressView()
                .onAppear {
                    if let url = url {
                        imageLoader.loadImage(from: url)
                    }
                }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}
