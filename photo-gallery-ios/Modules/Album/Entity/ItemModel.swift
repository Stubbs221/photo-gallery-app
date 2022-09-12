//
//  ItemModel.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 12.09.2022.
//

import Foundation
import UIKit

struct Section {
    var items: [ItemModel]
}

struct ItemModel {
    var photoView: UIImageView
    var albumTitle: String
    var albumCount: String
}
