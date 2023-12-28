//
//  fetchHotel.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 22.12.23.
//

import Foundation
import Alamofire

class NetworkService {
    
    static var shared = NetworkService()
        
    private init() {}
           
    func getHotels(successBlock: @escaping (HotelModel) -> Void, failureBlock: @escaping (Error) -> Void) {
        let urlString = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
        Alamofire.request (urlString)
            .validate ()
            .response { response in
                guard let data = response.data else {
                    if let error = response.error {
                        failureBlock(error)
                    }
                    return
                }
                        let decoder = JSONDecoder ()
                        guard let userResults = try? decoder.decode(HotelModel.self, from: data) else {
                            if let error = response.error {
                                failureBlock(error)
                            }
                            return
                        }
                successBlock(userResults)
              
                }
            }
        
    private func sendImageRequest(url: String, method: HTTPMethod, params: Parameters?, completion: @escaping ((Data?, Error?) -> Void)) {
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.prettyPrinted, headers: nil).response { responce in
            completion(responce.data, responce.error)
        }
    }
//
//    func getImage(imageURL: String, successBlock: @escaping (_ response: UIImage?) -> (), failtureBlock: @escaping (_ error: Error) -> ()) {
//        sendImageRequest(url: imageURL, method: .get, params: nil) { response, error in
//            if let error = error {
//                failtureBlock(error)
//            } else {
//                guard let data = response else {
//                    successBlock(nil)
//                    return
//                }
////                DispatchQueue.global(qos: .userInteractive).async {
//                    if let image = UIImage(data: data) {
//                        successBlock(image)
//                    } else {
//                        if let error = error {
//                            failtureBlock(error)
//                        }
//                    }
////                }
//            }
//        }
//    }
    
    func getImage(imageURL: String, successBlock: @escaping (_ response: UIImage?) -> (), failureBlock: @escaping (_ error: Error) -> ()) {
        // Check if the URL ends with ".jpg" or ".jpeg"
        if imageURL.lowercased().hasSuffix(".jpg") || imageURL.lowercased().hasSuffix(".jpeg") ||
            imageURL.lowercased().hasSuffix(".png"){
            sendImageRequest(url: imageURL, method: .get, params: nil) { response, error in
                if let error = error {
                    failureBlock(error)
                } else {
                    guard let data = response else {
                        successBlock(nil)
                        return
                    }
                    // Check if the data can be converted to UIImage
                    if let image = UIImage(data: data) {
                        successBlock(image)
                    } else {
                        let decodingError = NSError(domain: "ImageDecodingError", code: 0, userInfo: nil)
                        failureBlock(decodingError)
                    }
                }
            }
        } else {
            // URL doesn't end with ".jpg" or ".jpeg"
            let invalidURLError = NSError(domain: "InvalidImageURLError", code: 0, userInfo: nil)
            failureBlock(invalidURLError)
        }
    }

        
    func getRooms(successBlock: @escaping (RoomModel) -> Void, failureBlock: @escaping (Error) -> Void)  {
        let urlString = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: nil)
            failureBlock(error)
            return
        }

        let session = URLSession.shared

            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    failureBlock(error)
                    return
                }

                guard let data = data else {
                    let error = NSError(domain: "NoData", code: 0, userInfo: nil)
                    failureBlock(error)
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let room = try decoder.decode(RoomModel.self, from: data)
                    successBlock(room)
                } catch {
                    failureBlock(error)
                }
            }

            task.resume()
        }
    
    func getBooking(successBlock: @escaping (BookingModel) -> Void, failureBlock: @escaping (Error) -> Void){
        let urlString = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: nil)
            failureBlock(error)
            return
        }

        let session = URLSession.shared

            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    failureBlock(error)
                    return
                }

                guard let data = data else {
                    let error = NSError(domain: "NoData", code: 0, userInfo: nil)
                    failureBlock(error)
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let booking = try decoder.decode(BookingModel.self, from: data)
                    successBlock(booking)
                } catch {
                    failureBlock(error)
                }
            }

            task.resume()
        }
}


