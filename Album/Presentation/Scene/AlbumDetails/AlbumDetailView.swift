//
//  AlbumDetailView.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import SwiftUI

struct AlbumDetailView: View {
    @EnvironmentObject var router: Router
    
    var album: Album
    private var content: some View {
        VStack(spacing: 16) {
            AsyncImage(
                url: URL(string: album.thumbnailUrl)!,
                placeholder: { Text("Loading...") },
                image: { Image(uiImage: $0).resizable() }
            )
            .frame(width: 150, height: 150)
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        router.navigate(to: .albumViewer(url: album.url))
                    }
            )
            Text(album.title)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    var body: some View {
        content
            .navigationBarTitle("Album Detail")
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AlbumDetailView(album: Album(id: 1,
                                         albumId: 1,
                                         title: "Test Title",
                                         url: "https://via.placeholder.com/600/92c952",
                                         thumbnailUrl: "https://via.placeholder.com/150/92c952"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
