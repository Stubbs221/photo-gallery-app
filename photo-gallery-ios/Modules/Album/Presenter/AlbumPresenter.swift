//
//  AlbumPresenter.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 11.09.2022.
//

import Foundation
import Photos
import UIKit

protocol AlbumPresenterInput {
    var output: AlbumPresenterOutput? { get set }
}

protocol AlbumPresenterOutput: AnyObject {
    func presenterConvertFetchedAssets()
}

final class AlbumPresenter {
    
    weak var output: AlbumPresenterOutput?
    
    private var view: AlbumViewInput
    private var interactor: AlbumInteractorInput
    private var router: AlbumRouterInput
    
    var photoResult: PHFetchResult<PHAsset>?
    var smartAlbums: PHFetchResult<PHAssetCollection>?
    var userCollections: PHFetchResult<PHAssetCollection>?
    
    init(view: AlbumViewInput, interactor: AlbumInteractorInput, router: AlbumRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        interactor.getPermissionIfNecessary { [ weak self ] granted in
            
            guard granted,
            let self = self else { return }
            self.interactor.fetchAlbumData()
        }
        
        
        
    }
    
    private func fetchImageAsset(_ asset: PHAsset?, targetSize size: CGSize, contentMode: PHImageContentMode = .aspectFill, options: PHImageRequestOptions? = nil, completionHandler: ((Bool) -> Void)?) -> UIImage {
        guard let asset = asset else {
            completionHandler?(false)
            return UIImage()
        }
        
        var convertedImage: UIImage = UIImage()
        
        let resultHandler: (UIImage?, [AnyHashable: Any]?) -> Void = { image, info in
            guard let image = image else { return }
            convertedImage = image
            completionHandler?(true)
        }
        
        PHImageManager.default().requestImage(
            for: asset,
            targetSize: size,
            contentMode: contentMode,
            options: options,
            resultHandler: resultHandler)
        
        return convertedImage
    }
    
    private func fillSection() -> Section {
        var section = Section(items: [])
        return section
    }
    
}

extension AlbumPresenter: AlbumViewOutput {
    
}

extension AlbumPresenter: AlbumInteractorOutput {
    func interactorDidFetchPhotoAssets(with photoResult: PHFetchResult<PHAsset>, collectionResult: [PHFetchResult<PHAssetCollection>]) {
        self.photoResult = photoResult
        self.smartAlbums = collectionResult[0]
        self.userCollections = collectionResult[1]
        
        guard let photoResult = self.photoResult,
              let smartAlbums = self.smartAlbums,
              let userCollections = self.userCollections else { return }
        
//        let photoResultAsset = photoResult.firstObject
        var Item = ItemModel(photoView: self.photoResult?.firstObject.map {
            fetchImageAsset($0, targetSize: CGSize(width: 50, height: 50)) { success in
                success ? print("emptyView must be hidden") : print("photoView must be hidden")
            } 
        })
        
        
        
    }
    
    
    
}

