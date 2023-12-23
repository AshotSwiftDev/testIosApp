//
//  HotelModel.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 17.12.23.
//

import Foundation

struct HotelModel {
    var image: String
    var rating: String
    var name: String
    var description: String
    var price: String
    var conditions: String
    var lineInfo: String
    var wifiInfo: String
    var distanceToAirport: String
    var distanceToTheBeach: String
    var hotelInfo: String
    var room: [RoomlModel]
}
