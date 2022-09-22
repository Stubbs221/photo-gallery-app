//
//  PhotosRouter.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 22.09.2022.
//

import Foundation
import UIKit

protocol PhotosRouterInput {
    func showModule(with view: UIViewController)
}

final class PhotosRouter: PhotosRouterInput {
    
    weak var rootViewController: UIViewController?
    
    func showModule(with view: UIViewController) {
        
    }
}
