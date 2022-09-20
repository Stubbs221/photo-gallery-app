//
//  AlbumView.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 07.09.2022.
//

import UIKit
import Photos

protocol AlbumViewInput {
    var output: AlbumViewOutput? { get set }
    
    var dataSource: DataSource? { get set }
    
}

protocol AlbumViewOutput {
    
}

class AlbumView: UIViewController, AlbumViewInput {
    
    var output: AlbumViewOutput?
    
    var dataSource: DataSource? {
        didSet {
            collection?.collectionView.reloadData()
        }
    }
    
    var collection: UICollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        setupCollection()
//        PHPhotoLibrary.shared().register(self)
    }
    
//    deinit {
//        PHPhotoLibrary.shared().unregisterChangeObserver(self)
//    }
    
    func setupCollection() {
        
        guard let dataSource = dataSource else {
            return
        }

        let configurator = Configurator { (Cell, itemModel, collectionView, indexPath) -> AlbumViewCell in
            Cell.photoView.image = itemModel.photoView.image
            Cell.albumTitle.text = itemModel.albumTitle
            Cell.albumCount.text = itemModel.albumCount
            return Cell
        }
        collection = PluginCollectionViewController(dataSource: dataSource, configurator: configurator)
        
        guard let collection = collection else {
            return
        }

        add(child: collection, container: view)
    }
    
    func add(child: UIViewController, container: UIView, configure: (_ childView: UIView) -> Void = { _ in }) {
        addChild(child)
        container.addSubview(child.view)
        configure(child.view)
        child.didMove(toParent: self)
    }
}
