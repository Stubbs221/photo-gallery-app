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
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.interactor.fetchAlbumData()
            }
            
        }
        
        
        
    }
    
    private func fetchImageAsset(_ asset: PHAsset?, targetSize size: CGSize, contentMode: PHImageContentMode = .aspectFill, completionHandler: ((Bool) -> Void)?) -> UIImage {
        guard let asset = asset else {
            completionHandler?(false)
            return UIImage()
        }
        
        var convertedImage: UIImage = UIImage()
        
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.resizeMode = PHImageRequestOptionsResizeMode.exact
        options.isSynchronous = true
        
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
    
    private func fillSection(from collection: PHFetchResult<PHAssetCollection>) -> Section {
        var section = Section(items: [])
        var items: [ItemModel] = []
        
        collection.enumerateObjects { collection, numb, pointer in
            let fetchedAssets = PHAsset.fetchAssets(in: collection, options: nil)
            let item = ItemModel(photoView: fetchedAssets.firstObject.map({ asset in
                self.fetchImageAsset(asset, targetSize: CGSize(width: 200, height: 200), completionHandler: nil)
            }), albumTitle: collection.localizedTitle ?? "Untitled", albumCount: String(fetchedAssets.count))
            
            items.append(item)
        }
        section.items = items
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
        
        var dataSource = DataSource(sections: [])
        
        
        var allPhotosItem = ItemModel(photoView: self.photoResult?.firstObject.map {
        
            fetchImageAsset($0, targetSize: CGSize(width: 200, height: 200)) { success in
                success ? print("emptyView must be hidden") : print("photoView must be hidden")
            }
        }, albumTitle: "All Photos", albumCount: String(self.photoResult?.count ?? 0))
        
        
        dataSource.sections.append(Section(items: [allPhotosItem]))
        dataSource.sections.append(fillSection(from: smartAlbums))
        dataSource.sections.append(fillSection(from: userCollections))
        
        view.updateDataSource(with: dataSource)
        
        
        
    }
    
    
    
}

