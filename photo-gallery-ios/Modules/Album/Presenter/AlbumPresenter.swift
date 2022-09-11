//
//  AlbumPresenter.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 11.09.2022.
//

import Foundation

protocol AlbumPresenterInput {
    var output: AlbumPresenterOutput? { get set }
}

protocol AlbumPresenterOutput: AnyObject {
    
}

final class AlbumPresenter {
    
    weak var output: AlbumPresenterOutput?
    
    private var view: AlbumViewInput
    private var interactor: AlbumInteractorInput
    private var router: AlbumRouterInput
    
    init(view: AlbumViewInput, interactor: AlbumInteractorInput, router: AlbumRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        interactor.fetchAlbumData()
    }
   
}

extension AlbumPresenter: AlbumViewOutput {
    
}

extension AlbumPresenter: AlbumInteractorOutput {
    
}
