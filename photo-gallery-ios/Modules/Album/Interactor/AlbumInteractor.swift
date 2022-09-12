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
    func interactorDidFetchPhotoAssets(with photoResult: (Result<[PHFetchResult<PHAsset>], Swift.Error>), collectionResult: (Result<[PHFetchResult<PHAssetCollection>], Swift.Error>))
//    func interactorDidFetchAllPhotoAssets(with result: (Result<[PHFetchResult<PHAsset>], Swift.Error>))
//    func interactorDidFetchSmartAlbumsAssets(with result: (Result<[PHFetchResult<PHAssetCollection>], Swift.Error>))
}

final class AlbumInteractor: AlbumInteractorInput {
    
    weak var output: AlbumInteractorOutput?
    
    var sections: [AlbumSectionType] = [.all, .smartAlbums, .userCollections]
    
    private var allPhotos = PHFetchResult<PHAsset>()
    private var smartAlbums = PHFetchResult<PHAssetCollection>()
    private var userCollections = PHFetchResult<PHAssetCollection>()
    
    func fetchAlbumData() {
        print("start fetching photo data")
        let allPhotosOptioins = PHFetchOptions()
        allPhotosOptioins.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        
        allPhotos = PHAsset.fetchAssets(with: allPhotosOptioins)
        
        smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
                                                              subtype: .albumRegular,
                                                              options: nil)
        userCollections = PHAssetCollection.fetchAssetCollections(with: .album,
                                                                  subtype: .albumRegular,
                                                                  options: nil)
        
        guard let output = output else {
            print("output is not initiated")
            return
        }
        output.interactorDidFetchPhotoAssets(with: .success([allPhotos]), collectionResult: .success([smartAlbums, userCollections]))

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
