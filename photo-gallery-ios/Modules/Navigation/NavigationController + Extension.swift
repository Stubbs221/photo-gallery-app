//
//  NavigationController + Extension.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 22.09.2022.
//

import UIKit

extension UINavigationController {
    
    func getImageFrom(gradientLayer: CAGradientLayer) -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        var gradientColor = UIColor.label
        let blue = UIColor.systemBlue
        let purple = UIColor.systemPurple
        
        let largeTitleFont = UIFont.systemFont(ofSize: 40.0, weight: .bold)
        let longestTitle = "Albums!"
        let size = longestTitle.size(withAttributes: [.font : largeTitleFont])
        let gradient = CAGradientLayer()
        let bounds = CGRect(origin: navigationBar.bounds.origin, size: CGSize(width: size.width, height: navigationBar.bounds.height))
        gradient.frame = bounds
        gradient.colors = [blue.cgColor, purple.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        
        if let image = getImageFrom(gradientLayer: gradient) {
            gradientColor = UIColor(patternImage: image)
        }
        
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        
        if let largeTitleDescriptor = largeTitleFont.fontDescriptor.withDesign(.rounded) {
            scrollEdgeAppearance.largeTitleTextAttributes = [.font : UIFont(descriptor: largeTitleDescriptor, size: 0), .foregroundColor : gradientColor]
        }
        
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
    }
}
