//
//  fetchHotel.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 22.12.23.
//

import Foundation

class FetchHotel {
    
    static var shared = FetchHotel()

    private var hotelModel = [
        HotelModel(
            image: "hotel_image_1",
            rating: "5 Превосходно",
            name: "Steigenberger Makadi",
            description: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
            price: "134 673",
            conditions: "за тур с перелётом",
            lineInfo: "3-я линия",
            wifiInfo: "Платный Wi-Fi в фойе",
            distanceToAirport: "30 км до аэропорта",
            distanceToTheBeach: "1 км до пляжа",
            hotelInfo: "Отель VIP-класса с собственными гольф полями. Высокий уровень сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
            room: [
                RoomlModel(
                    image: "room_image_1",
                    type: "Стандартный с видом на бассейн или сад",
                    allInclusive: "Все включено",
                    option: "Кондиционер",
                    price: "186 600",
                    conditions: "за 7 ночей с перелётом"
                ),
                RoomlModel(
                    image: "room_image_2",
                    type: "Стандартный с видом на бассейн или сад",
                    allInclusive: "Все включено",
                    option: "Кондиционер",
                    price: "135 300",
                    conditions: "за 7 ночей с перелётом"
                )
            ]
        )
    ]

    func getHotels() -> [HotelModel] {
            return hotelModel
        }

    func getRoomInfo(forHotel hotel: HotelModel) -> [RoomlModel]? {
        return hotel.room.map { room in
            return RoomlModel(
                image: room.image,
                type: room.type,
                allInclusive: room.allInclusive,
                option: room.option,
                price: room.price,
                conditions: room.conditions
            )
        }
    }
}

class FetchBooking {
    static var shared = FetchBooking()

    private var bookingModel =
        BookingModel(rating: "5 Превосходно", name: "Steigenberger Makadi", description: "Madinat Makadi, Safaga Road, Makadi Bay, Египет", departureInfo: "Санкт-Петербург", arrivalIInfo: "Египет, Хургада", dateInfo: "19.09.2023 – 27.09.2023", numberOfNightsInfo: "7 ночей", hotelNameInfo: "Steigenberger Makadi", roomInfo: "Стандартный с видом на бассейн или сад", nutritionInfo: "Все включено", tourInfo: "186 600", fuelSurchargeInfo: "9 300", serviceFeeInfo:  "2 136", toPayInfo: "198 036")
    
    func getBookingList() -> BookingModel {
            return bookingModel
        }
}


