//
//  AlbumServerAPIImpl.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation

class AlbumServerAPIImpl: AlbumDataSource {
    func getAlbums() async throws -> [Album] {
        let endpoint = "https://jsonplaceholder.typicode.com/albums/1/photos"
        
        guard let url = URL(string: endpoint) else {
            throw ServerAPIError.urlError
        }
        guard let (data, response) = try? await URLSession.shared.data(from: url) else {
            throw ServerAPIError.requestError
        }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ServerAPIError.statusNotOK
        }  
        
        guard let result = try? JSONDecoder().decode([AlbumServerAPIEnity].self, from: data) else {
            throw ServerAPIError.decodingError
        }
        
        return result.map({ item in
            Album(
                id: item.id,
                albumId: item.albumId,
                title: item.title,
                url: item.url,
                thumbnailUrl: item.thumbnailUrl
            )
        })
    }
}
