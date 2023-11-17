//
//  AlbumApp.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import SwiftUI

@main
struct AlbumApp: App {
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                AlbumListView()
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .albumDetail(let album):
                        AlbumDetailView(album: album)
                    case .albumViewer(let url):
                        AlbumViewer(url: url)
                    }
                }
            }
            .environmentObject(router)
        }
    }
}
