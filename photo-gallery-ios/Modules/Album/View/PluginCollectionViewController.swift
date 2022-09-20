//
//  PluginCollectionViewController.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 07.09.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class PluginCollectionViewController<Configurator: ConfiguratorType>: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let dataSource: DataSource
    let configurator: Configurator
    
    let layout = UICollectionViewFlowLayout()
    
//    let collectionView: UICollectionView!
    
    init(dataSource: DataSource, configurator: Configurator) {
        self.dataSource = dataSource
        self.configurator = configurator
//        super.init(nibName: nil, bundle: nil)
        super.init(collectionViewLayout: layout)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//                layout.itemSize = CGSize(width: 111, height: 111)
//
//        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: self.layout)
//
//
        configurator.registerCells(in: collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.numberOfSections()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numberOfItems(in: section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSource.item(at: indexPath)
        
        return configurator.configuredCell(for: item, collectionView: collectionView, indexPath: indexPath)
    }
    
//    MARK: - Flow Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CollectionViewFlowLayoutType(.album, frame: view.frame).sizeForItemAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return CollectionViewFlowLayoutType(.album, frame: view.frame).sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionViewFlowLayoutType(.album, frame: view.frame).sectionInsets.left
    }
}

