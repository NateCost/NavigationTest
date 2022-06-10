//
//  SearchResultsPresenter.swift
//  NavigationTest (iOS)
//
//  Created by Ilya SAKALOU on 08/06/2022.
//

import Foundation

// MARK: - SearchResultsViewOutput
extension SearchResultsPresenter: SearchResultsViewOutput {
    func proceedDidTap() {
        flowUpdate?(.preCheckout)
    }
}
// MARK: - SearchResultsPresenter
extension SearchResultsPresenter {
    func reloadSearchResults() {
        print("reloaded")
        view?.setButtonTitle("reloaded, tap me")
    }
}

final class SearchResultsPresenter {
    private let context: SearchFlowContextType
    private var flowUpdate: SearchFlowCoordinator.SearchFlowUpdateHandler?
    weak var view: SearchResultsViewInput?

    init(context: SearchFlowContextType, flowUpdate: SearchFlowCoordinator.SearchFlowUpdateHandler?) {
        self.context = context
        self.flowUpdate = flowUpdate
        
        context.reloadSearchResults = { [weak self] in
            self?.reloadSearchResults()
        }
    }
}
