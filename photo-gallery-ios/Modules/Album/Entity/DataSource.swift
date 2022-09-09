//
//  DataSource.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 07.09.2022.
//

import Foundation

struct DataSource {
    var sections: [AlbumSectionType]
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard section < sections.count else { return 0 }
        return sections[section].items?.count
    }
    
    func
}
