//
//  UIButton + ext.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 21.12.23.
//
import UIKit

extension UIButton {
    enum ImagePosition {
        case left, right
    }
    
    func imagePosition(position: ImagePosition, spacing: CGFloat) {
        if position == .right {
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
        } else {
            semanticContentAttribute = .forceLeftToRight
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: 0)
        }
    }
}
