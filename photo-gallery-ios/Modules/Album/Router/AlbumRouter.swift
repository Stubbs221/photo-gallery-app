//
//  AlbumRouter.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 11.09.2022.
//

import Foundation
import UIKit

protocol AlbumRouterInput {
    func showModule(with data: DataSource)
}

final class AlbumRouter: AlbumRouterInput {
    
    
    weak var rootViewController: UIViewController?
    
    func showModule(with data: DataSource) {
        let vc = PhotosModuleBuilder.build(usingNavigationFarcory: NaviagationBuilder.build, with: data)
        vc.modalPresentationStyle = .fullScreen
        rootViewController?.present(vc, animated: true, completion: nil)
    }
    
}
