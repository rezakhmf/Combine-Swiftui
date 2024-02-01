//
//  SearchRepository.swift
//  Coles
//
//  Created by Reza Farahani on 30/1/2024.
//

import Foundation
import Combine

protocol SearchRepository {
    func fetchStores(query: String) -> AnyPublisher<[StoreModel], Error>
}

class DefaultSearchRepository: SearchRepository {
    func fetchStores(query: String) -> AnyPublisher<[StoreModel], Error> {
        guard let url = URL(string: query) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .tryMap { data in
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([StoreModel].self, from: data)
                    return result
                } catch {
                    throw URLError(.cannotParseResponse)
                }
            }
            .receive(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}
