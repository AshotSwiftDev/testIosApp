//
//  RoomModel.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 21.12.23.
//

import Foundation

// MARK: - RoomModel
struct RoomModel: Codable {
    let rooms: [Room]
}

// MARK: - Room
struct Room: Codable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
