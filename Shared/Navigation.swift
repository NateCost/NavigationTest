//
//  Navigation.swift
//  NavigationTest (iOS)
//
//  Created by Ilya SAKALOU on 08/06/2022.
//

import Foundation
import UIKit

protocol Navigation {
    func pop()
    func push(_ viewController: UIViewController)
    func present(_ viewController: UIViewController)
    func dismiss(_ completion: Closure?)
    func add(_ viewController: UIViewController)
}

// MARK: - Navigation
extension TestNavigation: Navigation {
    func pop() {
        navigation.popViewController(animated: true)
    }

    func push(_ viewController: UIViewController) {
        navigation.pushViewController(viewController, animated: true)
    }

    func present(_ viewController: UIViewController) {
        navigation.present(viewController, animated: true)
    }

    func dismiss(_ completion: Closure?) {
        navigation.dismiss(animated: true, completion: completion)
    }

    func add(_ viewController: UIViewController) {
        navigation.viewControllers.append(viewController)
    }
}

final class TestNavigation {
    let navigation: UINavigationController

    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}
