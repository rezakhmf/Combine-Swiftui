//
//  Store.swift
//  Coles
//
//  Created by Reza Farahani on 30/1/2024.
//

import Foundation

struct StoreModel: Codable {
    let id: Int
    let name: String
    let description: String
    let deliveryFee: Int
    let coverImageURL: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case status
        case deliveryFee = "delivery_fee"
        case coverImageURL = "cover_img_url"
    }
}

extension StoreModel {
    func toDomain() -> Store {
        return Store(id: id, name: name, deliveryFee: deliveryFee, coverImgUrl: coverImageURL)
    }
}
