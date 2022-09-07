//
//  ViewController.swift
//  photo-gallery-ios
//
//  Created by MAC on 17.08.2022.
//

import UIKit
import Photos


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPhotoPermission { (isAuthorized) in
            print("Разрешение в галерею получено %@", isAuthorized)
        }
    }
    
    private func getPhotoPermission(completion: @escaping (Bool) -> Void ) {
        
        guard PHPhotoLibrary.authorizationStatus() != .authorized else {
            completion(true)
            return
        }
        
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            completion(status == .authorized)
        }
    }

}

