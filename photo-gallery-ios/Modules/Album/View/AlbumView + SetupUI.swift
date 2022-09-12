//
//  AlbumView + SetupUI.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 12.09.2022.
//

import Foundation

extension AlbumView {
    func setupUI() {
        view.backgroundColor = .blue
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.topItem?.title = "Albums"
    }
}
