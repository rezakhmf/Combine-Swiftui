//
//  ColesApp.swift
//  Coles
//
//  Created by Reza Farahani on 30/1/2024.
//

import SwiftUI

@main
struct ColesApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = SearchViewModel(useCase: DefaultSearchUseCase(repository: DefaultSearchRepository()))
            StoreContent(viewModel: viewModel)
        }
    }
}
