//
//  CheckoutFlowCoordinator.swift
//  NavigationTest (iOS)
//
//  Created by Ilya SAKALOU on 10/06/2022.
//

import Foundation

final class CheckoutFlowCoordinator {
    typealias CheckoutFlowEndHandler = (CheckoutFlowEnd) -> Void
    typealias CheckoutFlowUpdateHandler = (CheckoutFlowUpdate) -> Void

    var flowEnd: CheckoutFlowEndHandler?
    var flowUpdate: CheckoutFlowUpdateHandler?
    private let navigation: Navigation

    init(
        flowEnd: CheckoutFlowEndHandler? = nil,
        navigation: Navigation
    ) {
        self.flowEnd = flowEnd
        self.flowUpdate = nil
        self.navigation = navigation
        bind()
    }

    func start() {
        let checkoutPresenter = CheckoutPresenter(flowUpdate: flowUpdate)
        let checkoutView = CheckoutView(output: checkoutPresenter)
        navigation.add(checkoutView)
    }

    private func bind() {
        flowUpdate = { [weak self, flowEnd] route in
            switch route {
            case .noDeliveryError:
                self?.navigation.dismiss {
                    flowEnd?(.noDeliveryError)
                }
            }
        }
    }
}

extension CheckoutFlowCoordinator {
    enum CheckoutFlowUpdate {
        case noDeliveryError
    }

    enum CheckoutFlowEnd {
        case noDeliveryError
    }
}
