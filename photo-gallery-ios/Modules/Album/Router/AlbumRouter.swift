//
//  AlbumRouter.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 11.09.2022.
//

import Foundation
import UIKit

protocol AlbumRouterInput {
    func showModule(with view: UIViewController)
}

final class AlbumRouter: AlbumRouterInput {
    
    
    weak var rootViewController: UIViewController?
    
    func showModule(with view: UIViewController) {
    }
    
}
