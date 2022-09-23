//
//  PhotosModuleBuilder.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 23.09.2022.
//

import UIKit

class PhotosModuleBuilder {
    static func build(usingNavigationFarcory factory: NavigationFactory, with data: DataSource) -> UIViewController {
        let view = PhotosView(dataSource: data)
        let interactor = PhotosInteractor()
        let router = PhotosRouter()
        let presenter = PhotosPresenter(view: view, interactor: interactor, router: router)
        
        view.output = presenter
        interactor.output = presenter
        
        router.rootViewController = view
        return factory(view)
    }
}
