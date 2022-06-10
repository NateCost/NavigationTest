//
//  SearchFlowCoordinator.swift
//  NavigationTest (iOS)
//
//  Created by Ilya SAKALOU on 10/06/2022.
//

import UIKit

final class SearchFlowCoordinator {
    typealias SearchFlowUpdateHandler = (SearchFlowRoute) -> Void
    typealias SearchFlowEndHandler = (SearchFlowEnd) -> Void

    // using inside of coordinators
    var flowEnd: SearchFlowEndHandler?
    // using inside of presenters
    var flowUpdate: SearchFlowUpdateHandler?
    
    private let navigation: Navigation
    private let searchFlowContext: SearchFlowContext
    private var checkoutFlowCoordinator: CheckoutFlowCoordinator?

    init(
        flowEnd: SearchFlowEndHandler? = nil,
        flowUpdate: SearchFlowUpdateHandler? = nil,
        navigation: Navigation,
        searchFlowContext: SearchFlowContext
    ) {
        self.flowEnd = flowEnd
        self.flowUpdate = flowUpdate
        self.navigation = navigation
        self.searchFlowContext = searchFlowContext
    }

    func start() {
        bind()

        let searchResultsPresenter = SearchResultsPresenter(
            context: searchFlowContext,
            flowUpdate: flowUpdate
        )
        let searchResultsView = SearchResultsView(output: searchResultsPresenter)
        searchResultsPresenter.view = searchResultsView
        navigation.add(searchResultsView)
    }

    private func pushToPreCheckout() {
        let preCheckoutPresenter = PreCheckoutPresenter(flowUpdate: flowUpdate)
        let preCheckoutView = PreCheckoutView(output: preCheckoutPresenter)
        navigation.push(preCheckoutView)
    }

    private func presentCheckout() {
        let checkoutFlowEnd: CheckoutFlowCoordinator.CheckoutFlowEndHandler = { [weak self] route in
            self?.checkoutFlowCoordinator = nil

            switch route {
            case .noDeliveryError:
                self?.navigation.pop()
                self?.searchFlowContext.reloadSearchResults?()
            }
        }
        let checkoutNavigationController = UINavigationController()
        checkoutFlowCoordinator = CheckoutFlowCoordinator(
            flowEnd: checkoutFlowEnd,
            navigation: TestNavigation(navigation: checkoutNavigationController)
        )
        checkoutFlowCoordinator?.start()
        navigation.present(checkoutNavigationController)
    }

    private func bind() {
        flowUpdate = { [weak self] route in
            guard let self = self else { return }

            switch route {
            case .preCheckout:
                self.pushToPreCheckout()
            case .back:
                self.navigation.pop()
            case .checkout:
                self.presentCheckout()
            }
        }
    }
}

extension SearchFlowCoordinator {
    enum SearchFlowRoute {
        case preCheckout
        case back
        case checkout
    }

    enum SearchFlowEnd {}
}
