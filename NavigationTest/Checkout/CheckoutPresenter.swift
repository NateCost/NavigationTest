//
//  CheckoutPresenter.swift
//  NavigationTest (iOS)
//
//  Created by Ilya SAKALOU on 08/06/2022.
//

import Foundation

// MARK: - CheckoutViewOutput
extension CheckoutPresenter: CheckoutViewOutput {
    func noDeliveryActionDidTap() {
        flowUpdate?(.noDeliveryError)
    }
}

final class CheckoutPresenter {
    private let flowUpdate: CheckoutFlowCoordinator.CheckoutFlowUpdateHandler?

    init(flowUpdate: CheckoutFlowCoordinator.CheckoutFlowUpdateHandler?) {
        self.flowUpdate = flowUpdate
    }
}
