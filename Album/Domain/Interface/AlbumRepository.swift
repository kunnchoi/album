//
//  AlbumRepository.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation

protocol AlbumRepository {
    func getAlbums() async throws -> [Album]
}
