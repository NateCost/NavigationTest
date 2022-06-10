//
//  SearchFlowContext.swift
//  NavigationTest (iOS)
//
//  Created by Ilya SAKALOU on 09/06/2022.
//

import Foundation

typealias Closure = () -> Void

protocol SearchFlowContextType: AnyObject {
    var reloadSearchResults: Closure? { get set }
}

final class SearchFlowContext: SearchFlowContextType {
    var reloadSearchResults: Closure?
}
