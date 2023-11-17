//
//  AlbumRespositoryImpl.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation

struct AlbumRespositoryImpl: AlbumRepository {
    var dataSource: AlbumDataSource
    
    func getAlbums() async throws -> [Album] {
        let albums = try await dataSource.getAlbums()
        
        return albums 
    }
}
