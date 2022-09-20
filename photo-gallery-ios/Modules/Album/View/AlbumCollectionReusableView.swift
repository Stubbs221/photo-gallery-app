//
//  AlbumCollectionReusableView.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 12.09.2022.
//

import UIKit

class AlbumCollectionReusableView: UICollectionReusableView {
        static let reuseIdentifier = "headerView"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
