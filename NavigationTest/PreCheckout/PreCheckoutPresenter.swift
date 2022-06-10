//
//  PreCheckoutPresenter.swift
//  NavigationTest (iOS)
//
//  Created by Ilya SAKALOU on 08/06/2022.
//

import Foundation
import SwiftUI

// MARK: - PreCheckoutViewOutput
extension PreCheckoutPresenter: PreCheckoutViewOutput {
    func proceedDidTap() {
        flowUpdate?(.checkout)
    }
}
// MARK: - PreCheckoutPresenter
extension PreCheckoutPresenter {
//    private func presentCheckout() {
//        let checkoutModal = composeCheckoutModal()
//        navigation.present(checkoutModal)
//    }
//
//    private func composeCheckoutModal() -> UINavigationController {
//        let checkoutContext = CheckoutContext()
//        checkoutContext.handleNoDeliveryError = { [weak self, context] in
//            self?.navigation.pop()
//            context.reloadSearchResults?()
//        }
//        let navigationController = UINavigationController()
//        let checkoutPresenter = CheckoutPresenter(
//            navigation: TestNavigation(navigation: navigationController),
//            context: checkoutContext
//        )
//        let checkoutView = CheckoutView(output: checkoutPresenter)
//        navigationController.viewControllers = [checkoutView]
//        return navigationController
//    }
}

final class PreCheckoutPresenter {
    private var flowUpdate: SearchFlowCoordinator.SearchFlowUpdateHandler?

    init(flowUpdate: SearchFlowCoordinator.SearchFlowUpdateHandler?) {
        self.flowUpdate = flowUpdate
    }
}
