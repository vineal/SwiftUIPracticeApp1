//
//  RemoteImage.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 04/03/21.
//

import SwiftUI

struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var loading: UIImage
    var failure: UIImage

    var body: some View {
        let image = selectImage()
        let calcHeight = calcImageHeight(image: image)
        Image(uiImage: image)
            .resizable()
            .frame(width: UIScreen.main.bounds.width-30, height: calcHeight)
            .aspectRatio(contentMode: .fit)
            
    }

    private func calcImageHeight(image : UIImage) -> CGFloat{
        let ascpectRatio = image.size.width/image.size.height
        let imageHeight = (UIScreen.main.bounds.width-30)/ascpectRatio
        return imageHeight
    }
    
    init(url: String, loading: UIImage = UIImage(systemName: "photo")!, failure: UIImage = UIImage(systemName: "multiply.circle")!) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> UIImage {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return image
            } else {
                return failure
            }
        }
    }
}
