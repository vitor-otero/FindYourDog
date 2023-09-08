//
//  AsyncImageView.swift
//  FindYourDog
//
//  Created by Vítor Otero on 04/09/2023.
//

import SwiftUI
import Combine

struct AsyncImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    let url: URL?
    
    var body: some View {
        Group {
            if let uiImage = imageLoader.image {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                DefaultImageView()
            }
        }
        .onAppear {
            if let url = url {
                imageLoader.loadImage(from: url)
            }
        }
    }
    
    @ViewBuilder
    private func DefaultImageView() -> some View {
        Image("no-image")
            .resizable()
            .scaledToFit()
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: URL?) {
        guard let url = url else {
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap { data in
                UIImage(data: data)
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.image = nil
                }
            } receiveValue: { image in
                self.image = image
            }
    }
}
