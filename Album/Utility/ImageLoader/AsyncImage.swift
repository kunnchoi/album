//
//  AsyncImage.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation
import SwiftUI

//TODO: implement image caching logic

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    
    init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if let loaderImage = loader.image {
                image(loaderImage)
            } else {
                placeholder
            }
        }
    }
}
