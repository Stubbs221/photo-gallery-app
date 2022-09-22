//
//  DataSource.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 07.09.2022.
//

import Foundation

struct DataSource {
    
    var sections: [Section]
    var sectionDescription: [AlbumSectionType] = [.all, .smartAlbums, .userCollections]
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard section < sections.count else { return 0 }
        return sections[section].items.count
    }
    
    func item(at indexPath: IndexPath) -> ItemModel {
        return sections[indexPath.section].items[indexPath.row]
    }
    
  
}


