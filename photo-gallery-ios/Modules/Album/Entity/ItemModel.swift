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
    var photoView: UIImage?
    var albumTitle: String = "default"
    var albumCount: String = "default"
}
