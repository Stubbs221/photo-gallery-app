//
//  Configurator.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 07.09.2022.
//

import UIKit

protocol ConfiguratorType {
    
    associatedtype Cell: AlbumViewCell
    
    func reuseIdentifier(for item: ItemModel, indexPath: IndexPath) -> String
    func registerCells(in collectionView: UICollectionView)
    func configuredCell(for item: ItemModel, collectionView: UICollectionView, indexPath: IndexPath) -> Cell
}


struct Configurator<Cell: AlbumViewCell>: ConfiguratorType {
    typealias CellConfigurator = (Cell, ItemModel, UICollectionView, IndexPath) -> Cell
    
    let configurator: CellConfigurator
    let reuseIdentifier =  "\(Cell.self)"
    
    func reuseIdentifier(for item: ItemModel, indexPath: IndexPath) -> String {
        return reuseIdentifier
    }
    
    func configure(cell: Cell, item: ItemModel, collectionView: UICollectionView, indexPath: IndexPath) -> Cell {
        return configurator(cell, item, collectionView, indexPath)
    }
    
    func registerCells(in collectionView: UICollectionView) {
        if let path = Bundle.main.path(forResource: "\(Cell.self)", ofType: "nib"),
           FileManager.default.fileExists(atPath: path) {
            let nib = UINib(nibName: "\(Cell.self)", bundle: .main)
            collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        } else {
            collectionView.register(Cell.self, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
    func configuredCell(for item: ItemModel, collectionView: UICollectionView, indexPath: IndexPath) -> Cell {
        let reuseIdentifier = self.reuseIdentifier(for: item, indexPath: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Cell
        return self.configure(cell: cell, item: item, collectionView: collectionView, indexPath: indexPath)
    }
}
