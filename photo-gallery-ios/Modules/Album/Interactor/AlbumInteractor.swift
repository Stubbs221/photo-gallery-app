//
//  AlbumInteractor.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 11.09.2022.
//

import Foundation
import Photos

protocol AlbumInteractorInput {
    var output: AlbumPresenterOutput? { get set }
    
    func fetchAlbumData()
}

protocol AlbumInteractorOutput: AnyObject {
    
}

final class AlbumInteractor: AlbumInteractorInput {
    
    weak var output: AlbumPresenterOutput?
    
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
    }
}
