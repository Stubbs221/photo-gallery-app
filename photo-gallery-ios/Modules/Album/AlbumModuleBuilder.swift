//
//  AlbumModuleBuilder.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 11.09.2022.
//

import UIKit

class AlbumModuleBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = AlbumView()
        let interactor = AlbumInteractor()
        let router = AlbumRouter()
        let presenter = AlbumPresenter(view: view, interactor: interactor, router: router)
        
        view.output = presenter
        interactor.output = presenter
        
        router.rootViewController = view
        return factory(view)
    }
}
