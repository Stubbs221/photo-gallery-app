//
//  AlbumViewCell.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 09.09.2022.
//

import UIKit

class AlbumViewCell: UICollectionViewCell {
    
    lazy var emptyView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "photo.on.rectangle")
        imageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return imageView
    }()
    
    lazy var photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    lazy var albumTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    lazy var albumCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumTitle.text = "Untitled"
        albumCount.text = "0 photos"
        photoView.image = nil
        photoView.isHidden = true
        emptyView.isHidden = false
    }
    
    func update(title: String?, count: Int) {
        albumTitle.text = title ?? "Untitled"
        albumCount.text = "\(count.description) \(count == 1 ? "photo" : "photos")"
    }
    
    func setupUI() {
        contentView.addSubview(emptyView)
        contentView.addSubview(photoView)
        contentView.addSubview(albumTitle)
        contentView.addSubview(albumCount)
        
        NSLayoutConstraint.activate([
            emptyView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emptyView.centerYAnchor.constraint(equalTo: photoView.centerYAnchor)])
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
        NSLayoutConstraint.activate([
            albumTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            albumTitle.bottomAnchor.constraint(equalTo: albumCount.topAnchor, constant: -8)])
        NSLayoutConstraint.activate([
            albumCount.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            albumCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        contentView.backgroundColor = .white
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
