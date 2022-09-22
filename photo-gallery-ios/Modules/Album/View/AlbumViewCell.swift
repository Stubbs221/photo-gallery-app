//
//  AlbumViewCell.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 09.09.2022.
//

import UIKit

class AlbumViewCell: UICollectionViewCell {
    
    
    lazy var viewForEmptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var emptyView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "photo.on.rectangle")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return imageView
    }()
    
    lazy var photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
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
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumTitle.text = "Untitled"
        albumCount.text = "0 photos"
        photoView.image = nil
//        photoView.isHidden = true
//        emptyView.isHidden = false
    }
    
    func update(title: String?, count: Int) {
        albumTitle.text = title ?? "Untitled"
        albumCount.text = "\(count.description) \(count == 1 ? "photo" : "photos")"
    }
    
    func setupUI() {
        contentView.addSubview(viewForEmptyView)
        viewForEmptyView.addSubview(emptyView)
        contentView.addSubview(photoView)
        contentView.addSubview(albumTitle)
        contentView.addSubview(albumCount)
        
        NSLayoutConstraint.activate([
            viewForEmptyView.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewForEmptyView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            viewForEmptyView.heightAnchor.constraint(equalTo: viewForEmptyView.widthAnchor)])
        NSLayoutConstraint.activate([
            emptyView.centerXAnchor.constraint(equalTo: viewForEmptyView.centerXAnchor),
            emptyView.centerYAnchor.constraint(equalTo: viewForEmptyView.centerYAnchor)])
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photoView.heightAnchor.constraint(equalTo: photoView.widthAnchor)])
        NSLayoutConstraint.activate([
            albumTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            albumTitle.bottomAnchor.constraint(equalTo: albumCount.topAnchor, constant: 0)])
        NSLayoutConstraint.activate([
            albumCount.leadingAnchor.constraint(equalTo: albumTitle.leadingAnchor),
            albumCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
