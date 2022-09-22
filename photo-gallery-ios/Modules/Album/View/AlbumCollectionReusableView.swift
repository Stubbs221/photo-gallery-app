//
//  AlbumCollectionReusableView.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 12.09.2022.
//

import UIKit

class AlbumCollectionReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = "headerView"
    
    lazy var labelView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        addSubview(labelView)
        labelView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: labelView.topAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor, constant: -5)])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = bounds
    }
}
