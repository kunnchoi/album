//
//  AlbumDataSource.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation

protocol AlbumDataSource {
    func getAlbums() async throws -> [Album]
}
