//
//  ContentView.swift
//  Shared
//
//  Created by Ilya SAKALOU on 08/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SearchResultsRepresentable()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    let navigationController = UINavigationController()

    static var previews: some View {
        ContentView()
    }
}

struct SearchResultsRepresentable: UIViewControllerRepresentable {
    var searchFlowCoordinator: SearchFlowCoordinator
    var navigationController: UINavigationController

    func makeUIViewController(context: Context) -> UINavigationController {
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) { }

    init() {
        navigationController = UINavigationController()
        navigationController.navigationBar.tintColor = .white
        searchFlowCoordinator = SearchFlowCoordinator(
            navigation: TestNavigation(navigation: navigationController),
            searchFlowContext: SearchFlowContext()
        )
        searchFlowCoordinator.start()
    }
}
