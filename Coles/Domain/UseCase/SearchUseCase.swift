//
//  SearchUseCase.swift
//  Coles
//
//  Created by Reza Farahani on 30/1/2024.
//

import Foundation
import Combine

protocol SearchUseCase {
    func execute(query: String) -> AnyPublisher<[Store], Error>
}

class DefaultSearchUseCase: SearchUseCase {
    
    private let repository: DefaultSearchRepository
    
    init(repository: DefaultSearchRepository) {
        self.repository = repository
    }
    
    func execute(query: String) -> AnyPublisher<[Store], Error> {
        let fullQuery = "https://dd-interview.github.io/android/v1/feed?query=\(query)&lat=37.7816&lng=-122.4156"
        return repository.fetchStores(query: fullQuery)
            .map { storeModels in
                return storeModels.map { storeModel in
                    return storeModel.toDomain()
                }
            }
            .eraseToAnyPublisher()
    }
}
