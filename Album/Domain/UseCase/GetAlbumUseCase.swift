//
//  GetAlbumUseCase.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation

protocol GetAlbums {
    func execute() async -> Result<[Album], UseCaseError>
}

struct GetAlbumUseCase: GetAlbums{
    var repo: AlbumRepository
    
    func execute() async -> Result<[Album], UseCaseError>{
        do {
            let albums = try await repo.getAlbums()
            
            return .success(albums)
        } catch (let error) {
            switch (error) {
            case ServerAPIError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}
