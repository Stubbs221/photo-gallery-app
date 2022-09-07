//
//  NavigationControllerBuilder.swift
//  photo-gallery-ios
//
//  Created by Vasily Maslov on 07.09.2022.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NaviagationBuilder {
    static func build(rootView:  UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.tintColor = .white
        return navigationController
    }
}

