//
//  Int + ext.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 27.12.23.
//

import Foundation

extension Int {
    func formattedWithSpaces() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
