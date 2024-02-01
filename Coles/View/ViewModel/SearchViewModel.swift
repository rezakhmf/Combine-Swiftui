//
//  StoreViewModel.swift
//  Coles
//
//  Created by Reza Farahani on 30/1/2024.
//

import Foundation
import Combine
import Network

class SearchViewModel: ObservableObject {
    @Published var searchTerm = ""
    @Published var searchResult: [Store] = []
    @Published var error: String?
    
    private var cancellable: Set<AnyCancellable> = []
    private var useCase: DefaultSearchUseCase
    private let monitor = NWPathMonitor()
    
    init(useCase: DefaultSearchUseCase) {
        self.useCase = useCase
        
        
        $searchTerm
            .debounce(for: .seconds(2), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .filter { term in
                term.count >= 3
            }
            .flatMap { term in
                self.useCase.execute(query: term)
            }
            .receive(on: DispatchQueue.main) 
            .sink(
                receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("hi")
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            } ,receiveValue: { stores in
                self.searchResult = stores
            })
            .store(in: &cancellable)

    }
        
}
