//
//  AlbumListViewModel.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation

@MainActor
class AlbumListViewModel: ObservableObject {
    var getAlbumUseCase = GetAlbumUseCase(repo: AlbumRespositoryImpl(dataSource: AlbumServerAPIImpl()))
    
    @Published var albums: [Album] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func getAlbums() async {
        errorMessage = ""
        let result = await getAlbumUseCase.execute()
        switch result{
        case .success(let albums):
            self.albums = albums
        case .failure(let error):
            self.albums = []
            errorMessage = error.localizedDescription
            hasError = true
        }
    }
}
