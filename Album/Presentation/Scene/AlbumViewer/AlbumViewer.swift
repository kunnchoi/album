//
//  AlbumViewer.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import SwiftUI

struct AlbumViewer: View {
    var url: String
    private var content: some View {
        AsyncImage(
            url: URL(string: url)!,
            placeholder: { Text("Loading...") },
            image: { Image(uiImage: $0).resizable() }
        ).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var body: some View {
        content
    }
}

struct AlbumViewer_Previews: PreviewProvider {
    static var previews: some View {
        AlbumViewer(url: "https://via.placeholder.com/600/92c952")
    }
}
