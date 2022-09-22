//
//  PhotosView.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 22.09.2022.
//

import UIKit

protocol PhotosViewInput {
    var output: PhotosViewOutput? { get set }
}

protocol PhotosViewOutput {
    
}

class PhotosView: UIViewController, PhotosViewInput {
    
    var output: PhotosViewOutput?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
