//
//  Sore.swift
//  Coles
//
//  Created by Reza Farahani on 30/1/2024.
//

import Foundation

struct Store: Hashable, Identifiable {
    let uniqueId = UUID()
    let id: Int
    let name: String
    let deliveryFee: Int
    let coverImgUrl: String
}
