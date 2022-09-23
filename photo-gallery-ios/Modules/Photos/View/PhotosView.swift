//
//  PhotosView.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 22.09.2022.
//

import UIKit

protocol PhotosViewInput {
    var output: PhotosViewOutput? { get set }
    
    var dataSource: DataSource? { get set }
    
    init(dataSource: DataSource)
}

protocol PhotosViewOutput {
    
}

class PhotosView: UIViewController, PhotosViewInput {
    
    var output: PhotosViewOutput?
    
    var dataSource: DataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(sectionLabel)
        NSLayoutConstraint.activate([
            sectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sectionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        // Do any additional setup after loading the view.
    }
    
    required init(dataSource: DataSource) {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var sectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.dataSource?.sections[0].items[0].albumTitle
        return label
    }()
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
