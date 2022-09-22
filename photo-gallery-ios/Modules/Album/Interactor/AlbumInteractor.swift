//
//  AlbumInteractor.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 11.09.2022.
//

import Foundation
import Photos

protocol AlbumInteractorInput {
    var output: AlbumInteractorOutput? { get set }
    
    func fetchAlbumData()
    func getPermissionIfNecessary(completionHandler: @escaping (Bool) -> Void)
}

protocol AlbumInteractorOutput: AnyObject {
    func interactorDidFetchPhotoAssets(with photoResult: PHFetchResult<PHAsset>, collectionResult: [PHFetchResult<PHAssetCollection>])
}

final class AlbumInteractor: AlbumInteractorInput {
    
    weak var output: AlbumInteractorOutput?
    
    var sections: [AlbumSectionType] = [.all, .smartAlbums, .userCollections]
    
    func fetchAlbumData() {
        print("start fetching photo data")
        let allPhotosOptioins = PHFetchOptions()
        allPhotosOptioins.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        
        let allPhotos = PHAsset.fetchAssets(with: allPhotosOptioins)
        
        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
                                                              subtype: .albumRegular,
                                                              options: nil)
        let userCollections = PHAssetCollection.fetchAssetCollections(with: .album,
                                                                  subtype: .albumRegular,
                                                                  options: nil)
        
        guard let output = output else {
            print("output is not initiated")
            return
        }
        output.interactorDidFetchPhotoAssets(with: allPhotos, collectionResult: [smartAlbums, userCollections])
        
    }
    
    func getPermissionIfNecessary(completionHandler: @escaping (Bool) -> Void) {
        
        guard PHPhotoLibrary.authorizationStatus(for: .readWrite) != .authorized else {
            print("PHPhoto Lib status isnt authorized")
            completionHandler(true)
            return
        }
        
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            print("Authorization requested")
            completionHandler(status == .authorized)
        }
    }
}
