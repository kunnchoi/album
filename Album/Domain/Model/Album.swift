//
//  Album.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation

struct Album: Identifiable, Codable, Hashable, Equatable {
    let id: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
