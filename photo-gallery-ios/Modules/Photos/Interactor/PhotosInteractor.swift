//
//  PhotosInteractor.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 22.09.2022.
//

import Foundation

protocol PhotosInteractorInput {
    var output: PhotosInteractorOutput? { get set }
}

protocol PhotosInteractorOutput: AnyObject {
    
}

final class PhotosInteractor: PhotosInteractorInput {
    weak var output: PhotosInteractorOutput?
    
}
