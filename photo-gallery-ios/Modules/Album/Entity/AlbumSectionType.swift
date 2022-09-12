//
//  AlbumSectiontype.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 07.09.2022.
//

import Foundation

enum AlbumSectionType: Int, CustomStringConvertible {
    case all, smartAlbums, userCollections
    
    var description: String {
        switch self {
        case .all: return "All Photos"
        case .smartAlbums: return "Smart Albums"
        case .userCollections: return "User Collection"
        }
    }
}

