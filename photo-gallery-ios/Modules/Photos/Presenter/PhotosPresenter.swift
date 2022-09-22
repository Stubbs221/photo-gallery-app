//
//  PhotosPresenter.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 22.09.2022.
//

import Foundation

protocol PhotosPresenterInput {
    var output: PhotosPresenterOutput? { get set }
}

protocol PhotosPresenterOutput: AnyObject {
    
}

final class PhotosPresenter: PhotosPresenterInput {
    weak var output: PhotosPresenterOutput?
    
    private var view: PhotosViewInput
    private var interactor: PhotosInteractorInput
    private var router: PhotosRouterInput
    
    init(view: PhotosViewInput, interactor: PhotosInteractorInput, router: PhotosRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        
    }
}

extension PhotosPresenter: PhotosViewOutput {
    
}

extension PhotosPresenter: PhotosInteractorOutput {
    
}
