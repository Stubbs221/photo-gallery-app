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
    
    func updateDataSource(with dataSource: DataSource)
}

protocol AlbumViewOutput {
    
}

class AlbumView: UIViewController, AlbumViewInput {
    
    var output: AlbumViewOutput?
    
    var dataSource: DataSource? {
        didSet {
            setupCollection()
        }
    }
    
    var collection: UICollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
        
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
            Cell.photoView.image = itemModel.photoView
            Cell.albumTitle.text = itemModel.albumTitle
            Cell.albumCount.text = itemModel.albumCount
            return Cell
        }
        
        collection = PluginCollectionViewController(dataSource: dataSource, configurator: configurator)
        collection?.collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.view.frame.minX - 5 )
        guard let collection = collection else {
            print("collection is nil")
            return
        }

        add(child: collection, container: view)
    }
    
    func add(child: UIViewController, container: UIView, configure: (_ childView: UIView) -> Void = { _ in }) {
        addChild(child)
        container.addSubview(child.view)
        configure(child.view)
        child.didMove(toParent: self)
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
            
        ])
    }
    
    func updateDataSource(with dataSource: DataSource) {
        self.dataSource = dataSource
        print("dataSource fetched successfuly")
        
    }
}
