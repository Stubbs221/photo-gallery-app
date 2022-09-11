//
//  AlbumView.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 07.09.2022.
//

import UIKit

protocol AlbumViewInput {
    var output: AlbumViewOutput? { get set }
}

protocol AlbumViewOutput {
    
}

class AlbumView: UIViewController, AlbumViewInput {
    
    var output: AlbumViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        // Do any additional setup after loading the view.
    }
    
    func setupCollection() {
        
        let dataSource = DataSource(sections: [.all, .smartAlbums, .userCollections])
        let configurator = Configurator { (cell, model: String, collectionView, indexPath) -> AlbumViewCell in
            cell.albumCount.text = model
            cell.albumTitle.text = model
            return cell
        }
        
        let collection = PluginCollectionViewController(dataSource: dataSource, configurator: configurator)
        
        add(child: collection, container: view)
    }
    
    func add(child: UIViewController, container: UIView, configure: (_ childView: UIView) -> Void = { _ in }) {
        addChild(child)
        container.addSubview(child.view)
        configure(child.view)
        child.didMove(toParent: self)
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
