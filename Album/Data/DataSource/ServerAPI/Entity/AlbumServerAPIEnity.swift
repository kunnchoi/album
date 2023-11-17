//
//  AlbumServerAPIEnity.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation

struct AlbumServerAPIEnity: Codable {
    let id: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
